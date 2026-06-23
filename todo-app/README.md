# To-Do List Application

A modern, feature-rich to-do list application with local storage functionality. Stay organized and track your tasks efficiently.

## ✨ Features

### Core Features
- **Add Tasks**: Quickly add new tasks with a simple input field
- **Mark Complete**: Check off tasks as you complete them
- **Delete Tasks**: Remove individual tasks
- **Priority Levels**: Set tasks as Low, Medium, or High priority
- **Filter Tasks**: View All, Active, or Completed tasks
- **Local Storage**: Automatically saves tasks to your browser

### Statistics
- Total tasks count
- Completed tasks count
- Remaining tasks count
- Real-time updates

### User Experience
- Modern gradient design
- Smooth animations and transitions
- Responsive mobile-friendly layout
- Visual feedback for all interactions
- Empty state message
- Keyboard shortcut (Enter to add)

### Bulk Actions
- Clear all completed tasks
- Clear all tasks (with confirmation)
- Batch operations

## 🚀 How to Use

### Adding Tasks
1. Type your task in the input field
2. Press Enter or click "Add Task"
3. Task appears at the top of your list

### Managing Tasks
- **Check the checkbox** to mark a task as complete
- **Select priority** from the dropdown (Low, Medium, High)
- **Click Delete** to remove a task
- Tasks are automatically saved to local storage

### Filtering
- Click **All** to see all tasks
- Click **Active** to see incomplete tasks
- Click **Completed** to see finished tasks

### Bulk Actions
- Click **Clear Completed** to remove all finished tasks
- Click **Clear All** to remove everything (confirms before deleting)

## 💾 Technical Details

### Storage
- Uses browser's **localStorage** API
- Tasks persist across browser sessions
- Automatic saving on every change
- Error handling for storage issues

### Technologies
- HTML5 for semantic structure
- CSS3 for modern styling (flexbox, gradients, animations)
- Vanilla JavaScript (no dependencies)
- Local Storage API for persistence

### Data Structure
```javascript
{
  id: timestamp,
  text: "Task description",
  completed: boolean,
  priority: "low" | "medium" | "high",
  createdAt: "ISO timestamp"
}
```

## 📦 Installation

1. Download or clone the repository
2. Open `index.html` in your web browser
3. Start adding tasks!

**No installation, no build process, no dependencies required!**

## 🌐 Browser Compatibility

| Browser | Support |
|---------|----------|
| Chrome  | ✅ Full  |
| Firefox | ✅ Full  |
| Safari  | ✅ Full  |
| Edge    | ✅ Full  |
| Opera   | ✅ Full  |
| Mobile  | ✅ Full  |

## 💡 Tips & Tricks

- **Keyboard Shortcut**: Press Enter while typing to quickly add a task
- **Priority Colors**: High (red), Medium (orange), Low (green)
- **Strikethrough**: Completed tasks show with a strikethrough
- **Persistent Data**: Close and reopen the page - your tasks are still there!
- **Responsive**: Works perfectly on desktop, tablet, and mobile

## 📝 Customization

### Change Colors
Edit the CSS variables in `styles.css`:
```css
:root {
    --primary-color: #667eea;      /* Main color */
    --secondary-color: #764ba2;    /* Accent color */
    --success-color: #48bb78;       /* Completed color */
    --danger-color: #f56565;        /* Delete color */
}
```

### Modify Task Limit
In `script.js`, change the character limit:
```javascript
if (text.length > 200) {  // Change 200 to your preferred limit
    this.showNotification('Task is too long...');
}
```

### Add More Priority Options
Edit the priority select dropdown in `script.js` render() method

## 🔒 Data Security

- Data stored locally in your browser only
- No data sent to any servers
- No tracking or analytics
- Completely private and secure
- Safe for sensitive tasks

## 🚀 Deployment Options

### GitHub Pages
1. Create a repository named `username.github.io`
2. Push these files to the repo
3. Access at `https://username.github.io`

### Netlify
1. Drag and drop the folder to Netlify
2. Gets a live URL instantly
3. Free hosting with automatic updates

### Self-Hosted
1. Upload files to your web server
2. Access via your domain
3. No backend required!

## 📊 Performance

- **Load Time**: < 1 second
- **File Size**: ~15 KB total (uncompressed)
- **Storage Limit**: 5-10 MB per browser
- **Works Offline**: Yes! ✅
- **No Dependencies**: Pure vanilla JavaScript

## 🔮 Future Enhancement Ideas

- Due dates for tasks
- Task categories/tags
- Drag and drop reordering
- Dark mode toggle
- Export/import functionality
- Cloud sync option
- Recurring tasks
- Task notes/descriptions
- Search functionality
- Multiple lists/projects

## 📄 License

Free to use and modify for personal or commercial projects. No restrictions.

## 🆘 Troubleshooting

### Tasks Not Saving?
- Check if browser local storage is enabled
- Try private/incognito mode might disable storage
- Clear browser cache and try again

### Tasks Disappeared?
- Check if you cleared browser data/cookies
- Local storage is per-browser, not synced across devices
- Data only persists in the same browser

### UI Looking Broken?
- Ensure all files are in the same directory
- Check browser console for JavaScript errors
- Try refreshing the page
- Check that CSS file is properly linked

## 📞 Support

If you encounter any issues:
1. Check the Troubleshooting section above
2. Review your browser console (F12) for errors
3. Verify all files are in the correct location
4. Try a different browser

## 🎉 Enjoy!

Start organizing your tasks today with this simple yet powerful to-do list application!
