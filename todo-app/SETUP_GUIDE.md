# To-Do List Application - Setup & Customization Guide

## ⚡ Quick Start (30 seconds)

1. Open `index.html` in any web browser
2. Start adding tasks immediately
3. Your tasks are automatically saved!

## 📁 What You Get

### Files Included
- `index.html` - Application structure and markup
- `styles.css` - Modern styling and animations
- `script.js` - Task management and storage logic
- `README.md` - Feature documentation
- `SETUP_GUIDE.md` - This file

## 🎯 Features at a Glance

✅ Add, complete, and delete tasks  
✅ Priority levels (Low, Medium, High)  
✅ Filter tasks by status (All, Active, Completed)  
✅ Local storage persistence  
✅ Responsive design - works on all devices  
✅ Zero dependencies - just HTML, CSS, JS  
✅ Keyboard shortcuts (Enter to add)  
✅ Real-time statistics  

## 🎨 Customization

### Change Color Scheme
Edit the CSS variables at the top of `styles.css`:

```css
:root {
    --primary-color: #667eea;      /* Main color */
    --secondary-color: #764ba2;    /* Accent/gradient color */
    --success-color: #48bb78;       /* Completed/checkmark color */
    --danger-color: #f56565;        /* Delete button color */
    --warning-color: #ed8936;       /* Priority warning color */
    --light-bg: #f7fafc;            /* Light background */
    --card-bg: #ffffff;             /* Card background */
    --text-primary: #2d3748;        /* Main text color */
    --text-secondary: #718096;      /* Secondary text color */
    --border-color: #e2e8f0;        /* Border color */
}
```

### Example Color Palettes

**Blue & Purple (Current)**
```css
--primary-color: #667eea;
--secondary-color: #764ba2;
```

**Green & Teal**
```css
--primary-color: #10b981;
--secondary-color: #0891b2;
```

**Red & Orange**
```css
--primary-color: #ef4444;
--secondary-color: #f97316;
```

**Dark Mode (Blue)**
```css
--card-bg: #1a202c;
--text-primary: #f7fafc;
--text-secondary: #cbd5e0;
--border-color: #2d3748;
--light-bg: #2d3748;
```

### Change Font
Replace the font in `styles.css`:

```css
body {
    font-family: 'Your Font Name', sans-serif;
}
```

Popular font choices:
- `'Segoe UI', sans-serif` (Windows)
- `'Apple System Font', sans-serif` (Mac)
- `'Roboto', sans-serif` (Modern)
- `'Inter', sans-serif` (Minimal)

### Modify Task Limit
In `script.js`, find the `addTask()` method:

```javascript
if (text.length > 200) {  // Change 200 to your preferred limit
    this.showNotification('Task is too long (max 200 characters)');
    return;
}
```

Change `200` to any number you prefer.

### Add More Priority Options
In `script.js`, update the priority dropdown:

```javascript
<select class="priority-select" ...>
    <option value="urgent">Urgent</option>
    <option value="high">High</option>
    <option value="medium">Medium</option>
    <option value="low">Low</option>
    <option value="someday">Someday</option>
</select>
```

Then add CSS for the new priority:

```css
.task-priority.urgent {
    background: rgba(220, 38, 38, 0.2);
    color: #dc2626;
}

.task-priority.someday {
    background: rgba(107, 114, 128, 0.2);
    color: #6b7280;
}
```

### Change Header Text
In `index.html`, modify the header:

```html
<h1>📝 My To-Do List</h1>
<p class="subtitle">Stay organized and productive</p>
```

Change the emoji and text to your preference:
- 📝 Tasks
- 🎯 Goals
- ✓ Checklist
- 📋 Items

### Adjust Animation Speed
In `styles.css`, change the transition duration:

```css
--transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
/*           ↑ change 0.3s to slower (0.5s) or faster (0.2s) */
```

## 💾 Data Management

### Where Data Is Stored
- Browser's **localStorage** under the key `"tasks"`
- Data persists even after closing the browser
- Each browser/device has its own storage
- Storage limit: 5-10 MB per domain

### View Your Tasks Data (Developer Tools)

1. Right-click anywhere → **Inspect** (or press **F12**)
2. Go to **Application** tab
3. Click **Local Storage** in the left sidebar
4. Select your domain
5. Find the `"tasks"` key

### Backup Your Tasks

In browser console (F12 → Console):
```javascript
// Copy your tasks
JSON.stringify(JSON.parse(localStorage.getItem('tasks')), null, 2)

// Paste this JSON in a text file to backup
```

### Restore Tasks

In browser console:
```javascript
// Paste your backup JSON
localStorage.setItem('tasks', '[{...your JSON...}]')
location.reload()
```

### Clear All Local Data

In browser console:
```javascript
localStorage.removeItem('tasks')
location.reload()
```

## 🔧 Advanced Customization

### Auto-save Frequency
Tasks are saved immediately on every change. To change this, modify the `saveTasks()` method in `script.js`.

### Add Local Notifications
Replace the `showNotification()` method in `script.js` with a toast library like Toastr.js:

```javascript
showNotification(message) {
    // Using Toastr.js (add script tag first)
    toastr.success(message);
}
```

### Add Date & Time
Modify the task object to include due dates:

```javascript
const task = {
    // ... existing properties
    dueDate: document.getElementById('dueDate').value,
    dueTime: document.getElementById('dueTime').value
};
```

## 📱 Responsive Adjustments

The app is responsive by default. To customize mobile behavior, find the media query at the bottom of `styles.css`:

```css
@media (max-width: 480px) {
    /* Mobile-specific styles */
}
```

## 🌐 Deployment

### GitHub Pages (Free)
1. Create repo: `username.github.io`
2. Push all files
3. Accessible at `https://username.github.io`

### Netlify (Free)
1. Go to [netlify.com](https://netlify.com)
2. Drag and drop the folder
3. Gets instant URL

### Vercel (Free)
1. Go to [vercel.com](https://vercel.com)
2. Import the repository
3. Auto-deploys on push

### Self-Hosted
1. Upload files to your web server
2. Access via your domain
3. No backend required!

## 📊 Performance Tips

- **Minify CSS/JS** for smaller file sizes
- **Compress images** if adding any
- **Use CDN** for global distribution
- **Cache headers** for repeat visitors

## 🐛 Troubleshooting

### Tasks Not Saving
- Check if localStorage is enabled in browser settings
- Private/incognito mode might disable storage
- Try a different browser
- Clear cache and cookies

### Styling Not Applied
- Ensure `styles.css` is in the same folder
- Check file name spelling is correct
- Clear browser cache (Ctrl+Shift+Del)
- Check browser console for errors

### JavaScript Not Working
- Ensure `script.js` is in the same folder
- Check console (F12) for error messages
- Verify all function names are spelled correctly
- Try a different browser

### Responsive Design Issues
- Check viewport meta tag is present in HTML
- Test on actual mobile device or browser dev tools
- Verify CSS media queries are correct

## 📚 Additional Resources

- [MDN: localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
- [CSS Variables Guide](https://developer.mozilla.org/en-US/docs/Web/CSS/--*)
- [JavaScript Classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)
- [Responsive Design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)

## 🎉 You're All Set!

Your to-do list app is ready to customize and deploy. Have fun!
