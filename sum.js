
const sum = (...nums) => {
	return nums.reduce((acc,value)=>{
		return acc+value
	})
}

console.log(sum(1,2,3,4,5))
