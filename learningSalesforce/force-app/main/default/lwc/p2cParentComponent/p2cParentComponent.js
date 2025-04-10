import { LightningElement,api } from 'lwc';

export default class P2cParentComponent extends LightningElement {
    carouselData = [
        {
            src:"https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fimage&psig=AOvVaw3vybNCNs7QnMsld5J0Q4V5&ust=1736246137776000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMCt58Hz4IoDFQAAAAAdAAAAABAE",
            header: "First Card",
            description: "First card description."
        },
        {
            src: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fletsenhance.io%2F&psig=AOvVaw3vybNCNs7QnMsld5J0Q4V5&ust=1736246137776000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMCt58Hz4IoDFQAAAAAdAAAAABAJ",
            header: "Second Card",
            description: "Second card description."
        },
        {
            src: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fgratisography.com%2F&psig=AOvVaw3vybNCNs7QnMsld5J0Q4V5&ust=1736246137776000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMCt58Hz4IoDFQAAAAAdAAAAABAR",
            header: "Third Card",
            description: "Third card description."
        }
    ]    
    percentage=10
    changeHandler(event){
        this.percentage=event.target.value
    }

    handleClick(){
        this.template.querySelector('c-p2c-slider-component').resetSlider()
    }
}