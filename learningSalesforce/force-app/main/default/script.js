// /**Var**/
// //It can be updated and also can be re-declared.
// //Var keyword two type of scope global and function
// //not to block level scope
// // var course="Zero to Hero"
// // console.log(course)
// // var course="zero to hero in lwc"
// // console.log(course)
// // console.log(window.course)

// // function abc(){
// //     var anotherCourse="Hero in LWC"
// //     console.log(anotherCourse)
// // }
// // abc()
// // // // console.log(anotherCourse)

// // /**Let Keyword */
// // //It can be updated and also cannot be re-declared
// // let course="Zero to hero"
// // console.log(course)
// // course="Zero to hero in LWC"
// // console.log(course)
// // console.log(window.course)

// // function abc(){
// //     let x="ankit"
// //     console.log(x)
// // }
// // abc()
// // // console.log(x)
// // if(2==2){
// //     let y="nikil"
// // }


// //**Const Keyword */
// //It can't be updated and also can't be re-declared
// const course="Zero to hero"
// console.log(course)


// var x=10.55
// console.log(typeof x)

// //big int
// var y=10n
// console.log(typeof y)

// //String
// var name='ankit'
// console.log(typeof name)
// //boolean
// var isMonday=true
// console.log(typeof isMonday)

// //undefined
// var z
// console.log(typeof z)

// //object
// var obj={}
// console.log(typeof obj)

// var arr=[]
// console.log(typeof arr)

// //symbol
// var sym=Symbol("id")
// console.log(typeof sym)

// //null
// var x=10
// x=null
// console.log(typeof x)

// //String() boolean()
// console.log(typeof new String("ankit"))

// // //Eqyality comparison
// // //Normal(==) //Only compare value
// // console.log(3=="3")
// // console.log("nikil"=="nikil")

// // //Strict (===)// Compare value + data type
// // console.log(3===3)
// // Null Vs Undefined
// var x
// console.log(x)

// var y=null
// console.log(y)
// console.log(x==y)
// console.log(x===y)

// // Spread Operator

// //1. Array
// var arr=["a","b","c","d"]
// console.log(arr)
// //array index start from zero
// console.log(arr[0])
// arr.push("3")
// console.log(arr)

// // 2. Objects

// var obj={
//     "name":"salesforce",
//     "age":23,
//     "full name":"zero to hero"
// }
// console.log(obj.name)
// console.log(obj.age)
// console.log(obj["full name"])
// obj.hobbies="criket"
// console.log(obj)

// // Spread Operator

// // 1. Expanding of String
// let greeting="Hello Everyone"
// let charlist=[...greeting]
// console.log(charlist)
// var arr=[...greeting]
// console.log(arr[0])

// // 2. Combining Array
// let arr1=["amazon","goggle"]
// let arr2=["facebook","instagram"]
// let arr3=[...arr1,...arr2]
// console.log(arr3)

// // 3. Adding Values to an array
// let arr4=["a","b","c"]
// let arr5=["nikil",...arr4]
// console.log(arr5)

// // 4. Combining Objects
// let obj1={
//     name:"Salesforce",
//     age:"24",
//     date:"31/12/2000"
// }
// let obj2={
//     name:"facebook",
//     age:"55"
// }
// let obj3={...obj1,...obj2}
// console.log(obj3)

// //5. Shallow Copy
// var arr10=["x","y","z"]
// var arr11=[...arr10]
// arr11.push("nikil")
// console.log(arr10)
// console.log(arr11)


// //6. Nested Copy
// var arrobj=[
//     {name:"nikhil"},
//     {name:"Salesforce"}
// ]
// var arrObj1=JSON.parse(JSON.stringify(arrobj))
// arrObj1[0].name="Ankit"
// console.log(arrobj)
// console.log(arrObj1)

// //Array Destructuring
// // let arr=["amazon","google"]
// // let[company1,company2]=arr
// // console.log(company1)
// // console.log(company2)

// //Object Destructuring
// let obj={
//     title:"Saleforce Developer",
//     age:"23"
// }
// let{title,age}=obj
// console.log(title)
// console.log(age)
// String Interpolation
// var name="Ankit Gupta"
// var age=23
// console.log(`Hello, I am ${name} and I am ${age} old.`)

// String Method
// let str="Hello guys, I hope you are doing good"

// // includes()

// console.log(str.includes('hope'))

// // indexOf()
// console.log(str.indexOf('hope'))

// // toLowerCase()
// console.log(str.toLowerCase())

// // toUpperCase()
// console.log(str.toUpperCase())

// // startsWith()
// // Determins whether a string begins with the characters of a specified string
// console.log(str.startsWith("Hello"))

// // Slice()
// // Method extracts parts of a string and returns the extracted parts in a new string.
// // str.slice(start,end)

// console.log(str.slice(0,5))

// // trim() - removes whitespace from both sides of a string
// let searchText="     salesforce lwc   "
// console.log(searchText.trim())

// // Object/JSON Operations
// // JSON --> JavaScript Object Notations

// let obj={
//     name:"Salesforce",
//     age:23,
//     dob:'23/10/1130'
// }
// // 1. Object.keys()
// console.log(Object.keys(obj))
// // 2. Object.values()
// console.log(Object.values(obj))


// // JSON.stringify
// let str=JSON.stringify(obj)
// console.log(str)

// // JSON.parse
// console.log(JSON.parse(str))

// Array Method()
// let arr=[2,3,5,7,9,10]

// // syntax
// // arr.methodName(function(currentItem,index,actualArray){})
// let age=[32,33,18,40]
// // some()
// let isAdult=age.some(function(currentItem){
//     return currentItem>32
// })
// console.log(isAdult)

// every()
// let isAllAdult=age.every(function(currentItem,index,array){
//     return currentItem>18
// })
// console.log(isAllAdult)
// map
// let newArray=arr.map(function(currentItem,index,array){
//     console.log(`CurrentItem is ${currentItem} index is ${index} array is ${array}`)
//     return currentItem*2    
// })
// console.log(`Old Array ${arr}`)
// console.log(`New Array ${newArray}`)

// filter()
// let filteredValues=arr.filter(function(currentItem,index,array){
//     return currentItem>5
// })
// console.log(filteredValues)

// sort()
// var names=["nikhil","naman","ankit"]
// console.log(names.sort())

// Sorting of a number
// var points=[10,39,12,80,54]
// let sortedArr=points.sort(function(a,b){
//     return a-b
// })
// console.log(sortedArr)

// reduce method
// Synatx
// array.reduce(function(total,currentValue,index,array){
// },intialValue)
//  let num=[12,78,30]
// let sum=num.reduce(function(total,currentItem){
//     return total+currentItem
// },0)
// console.log(sum)

// forEach()
// num.forEach(function(currentItem){
//     console.log(currentItem)
// })



// Promise
// new Promise(function(resolve,reject){
// return resolve("success")
// })
// function checkIsSuccess(data){
//    return new Promise(function(resolve,reject){
//         if(data==="SUCCESS"){
//             return resolve("Successfully executed")
//         }else{
//             return reject("UnSuccessfully Executed")
//         }
//     })
// }
// checkIsSuccess('Error').then(function(result){
//     console.log(result)
// }).catch(function(error){
//     console.error(error)
// })

// import {PI,add} from './utils.js'
// console.log(PI)
// console.log(add(2,3))

// QuerySelector

// let element=document.querySelector('div')
// console.log(element.innerText)
// element.style.color="red"

// let elements=document.querySelectorAll('div')
// console.log(elements)
// Array.from(elements).forEach(function(item){
//     item.style.color="green"
// })


// Arrow Function
// 1. Normal Function
// function getName(){
//     console.log("Ankit")
// }
// getName()

// 2. Arrow Function with return or console
// const getName=()=>{
//     return "Nikhil"
// }
// console.log(getName())

// 3. Arrow Function without return
// const getName=()=>"Aman"
// console.log(getName())

// // setTimeout
// let timerId=window.setTimeout(function(){
//     console.log("Hello")
// },2000)
// console.log(timerId)

// // setInterval
// let intervalId=window.setInterval(function(){
//     console.log("Hello")
// },1000)
// console.log(intervalId)

// function firstFunction(){
//     console.log("Hello")
// }