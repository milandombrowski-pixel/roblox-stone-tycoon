// Task Management System
class TodoApp {
    constructor() {
        this.tasks = [];
        this.currentFilter = 'all';
        this.init();
    }

    init() {
        this.loadTasks();
        this.setupEventListeners();
        this.render();
    }

    setupEventListeners() {
        // Add task
        document.getElementById('addBtn').addEventListener('click', () => this.addTask());
        document.getElementById('taskInput').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') this.addTask();
        });

        // Filter buttons
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.addEventListener('click', (e) => this.setFilter(e.target.dataset.filter));
        });

        // Clear buttons
        document.getElementById('clearCompleted').addEventListener('click', () => this.clearCompleted());
        document.getElementById('clearAll').addEventListener('click', () => this.clearAll());
    }

    addTask() {
        const input = document.getElementById('taskInput');
        const text = input.value.trim();

        if (!text) {
            this.showNotification('Please enter a task');
            return;
        }

        if (text.length > 200) {
            this.showNotification('Task is too long (max 200 characters)');
            return;
        }

        const task = {
            id: Date.now(),
            text: text,
            completed: false,
            priority: 'medium',
            createdAt: new Date().toISOString()
        };

        this.tasks.unshift(task);
        this.saveTasks();
        this.render();
        input.value = '';
        input.focus();
        this.showNotification('Task added successfully!');
    }

    deleteTask(id) {
        this.tasks = this.tasks.filter(task => task.id !== id);
        this.saveTasks();
        this.render();
        this.showNotification('Task deleted');
    }

    toggleTask(id) {
        const task = this.tasks.find(t => t.id === id);
        if (task) {
            task.completed = !task.completed;
            this.saveTasks();
            this.render();
        }
    }

    setPriority(id, priority) {
        const task = this.tasks.find(t => t.id === id);
        if (task) {
            task.priority = priority;
            this.saveTasks();
            this.render();
        }
    }

    setFilter(filter) {
        this.currentFilter = filter;
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.classList.toggle('active', btn.dataset.filter === filter);
        });
        this.render();
    }

    getFilteredTasks() {
        switch (this.currentFilter) {
            case 'active':
                return this.tasks.filter(task => !task.completed);
            case 'completed':
                return this.tasks.filter(task => task.completed);
            default:
                return this.tasks;
        }
    }

    clearCompleted() {
        const completedCount = this.tasks.filter(t => t.completed).length;
        if (completedCount === 0) {
            this.showNotification('No completed tasks to clear');
            return;
        }

        if (confirm(`Clear ${completedCount} completed task(s)?`)) {
            this.tasks = this.tasks.filter(task => !task.completed);
            this.saveTasks();
            this.render();
            this.showNotification('Completed tasks cleared');
        }
    }

    clearAll() {
        if (this.tasks.length === 0) {
            this.showNotification('No tasks to clear');
            return;
        }

        if (confirm('Are you sure? This will delete all tasks!')) {
            this.tasks = [];
            this.saveTasks();
            this.render();
            this.showNotification('All tasks cleared');
        }
    }

    updateStats() {
        const total = this.tasks.length;
        const completed = this.tasks.filter(t => t.completed).length;
        const remaining = total - completed;

        document.getElementById('totalTasks').textContent = `Total: ${total}`;
        document.getElementById('completedCount').textContent = `Completed: ${completed}`;
        document.getElementById('remainingCount').textContent = `Remaining: ${remaining}`;
    }

    render() {
        const filteredTasks = this.getFilteredTasks();
        const taskList = document.getElementById('taskList');
        const emptyState = document.getElementById('emptyState');

        // Update stats
        this.updateStats();

        // Toggle empty state
        if (filteredTasks.length === 0) {
            taskList.innerHTML = '';
            emptyState.classList.remove('hidden');
            return;
        }

        emptyState.classList.add('hidden');
        taskList.innerHTML = filteredTasks.map(task => `
            <li class="task-item ${task.completed ? 'completed' : ''}">
                <input 
                    type="checkbox" 
                    class="task-checkbox" 
                    ${task.completed ? 'checked' : ''}
                    onchange="app.toggleTask(${task.id})"
                >
                <span class="task-text">${this.escapeHtml(task.text)}</span>
                <select class="priority-select" value="${task.priority}" onchange="app.setPriority(${task.id}, this.value)" style="background: transparent; border: 1px solid var(--border-color); padding: 4px; border-radius: 4px; cursor: pointer; font-weight: 600; font-size: 0.75rem;">
                    <option value="low">Low</option>
                    <option value="medium">Medium</option>
                    <option value="high">High</option>
                </select>
                <button class="task-delete" onclick="app.deleteTask(${task.id})">Delete</button>
            </li>
        `).join('');
    }

    escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    showNotification(message) {
        // Simple notification in console (can be enhanced with toast library)
        console.log('📋 ' + message);
    }

    saveTasks() {
        try {
            localStorage.setItem('tasks', JSON.stringify(this.tasks));
        } catch (error) {
            console.error('Error saving tasks:', error);
            this.showNotification('Failed to save tasks');
        }
    }

    loadTasks() {
        try {
            const saved = localStorage.getItem('tasks');
            this.tasks = saved ? JSON.parse(saved) : [];
        } catch (error) {
            console.error('Error loading tasks:', error);
            this.tasks = [];
        }
    }
}

// Initialize app when DOM is ready
const app = new TodoApp();