import { LightningElement, track } from 'lwc';

export default class TodoApp extends LightningElement {
    @track tasks = []; // Holds list of tasks
    newTask = '';
    newDuration = '';
    newCategory = '';

    newCategories = [
        { label: 'Personal', value: 'Personal' },
        { label: 'Work', value: 'Work' },
        { label: 'Social', value: 'Social' },
        { label: 'Others', value: 'Others' }
    ];

    get categorieOptions() {
        return this.newCategories;
    }

    handleChange(event) {
        const { name, value } = event.target;
        this[name] = value;
    }

    handleAddTask() {
        if (this.newTask && this.newDuration && this.newCategory) {
            const durationNumber = parseInt(this.newDuration, 10); // Convert string to number
            
            if (isNaN(durationNumber) || durationNumber <= 0) {
                alert('Please enter a valid duration in minutes.');
                return;
            }

            this.tasks = [
                ...this.tasks,
                {
                    id: this.tasks.length + 1,
                    name: this.newTask,
                    duration: durationNumber,
                    category: this.newCategory
                }
            ];
            
            // Update total duration
            this.totalDuration += durationNumber;

            // Clear input fields
            this.newTask = '';
            this.newDuration = '';
            this.newCategory = '';
        }
    }
}
