import { LightningElement,track} from 'lwc';

export default class CalorieTracker extends LightningElement {

    @track meals = [
        { name: 'Breakfast', foods: [], totalCalories: 0 },
        { name: 'Lunch', foods: [], totalCalories: 0 },
        { name: 'Dinner', foods: [], totalCalories: 0 },
        { name: 'Snacks', foods: [], totalCalories: 0 }
    ];

    newFood = '';
    newCalories = '';
    newMeal = 'Breakfast';

    get mealOptions() {
        return this.meals.map(meal => ({ label: meal.name, value: meal.name }));
    }

    handleInputChange(event) {
        const { name, value } = event.target;
        this[name] = value;
    }
    handleAddFood(){
        if(this.newFood.trim() && this.newCalories>0){
            const meal=this.meals.find(m=>m.name===this.newMeal);
            if(meal){
                const newFoodItem={
                    id:Date.now().toString(),
                    name:this.newFood.trim(),
                    calories:parseInt(this.newCalories,10)
                };
                meal.foods=[...meal.foods,newFoodItem];
                meal.totalCalories+=newFoodItem.calories;
                this.newFood='';
                this.newCalories='';
            }else{
                alert('Please enter a valid food name and calories');
            }
        }
    }
    handleRemoveFood(event){
        const{mealName,foodId}=event.detail;
        const meal=this.meals.find(m=>m.name===mealName);
        if(meal){
            const foodIndex=meal.foods.findIndex(f=>f.id===foodId);
            if(foodIndex>-1){
                meal.totalCalories-=meal.foods[foodIndex].calories;
                meal.foods.splice(foodIndex,1);
                this.meals=[...this.meals];
            }
        }
    }
    get totalDailyCalories(){
        return this.meals.reduce((total,meal)=>total+meal.totalCalories,0);
    }
}