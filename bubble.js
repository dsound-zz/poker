const nums = [2,22,3,66,45,3,7,10,12]
const bubbleSort = nums => {
    
    let temp;
    let noSwaps;
    for (let i = nums.length; i > 0; i--) {
        noSwaps = true;
     
        for (let j = 0; j < i - 1; j++) {
        console.log(nums, nums[j], nums[j+1])
            if (nums[j] > nums[j+1]) {
            temp = nums[j] 
            nums[j] = nums[j+1] 
            nums[j+1] = temp;
            noSwaps = false
            }
        }
        console.log(i)
        if (noSwaps) break; 
        
    }
    console.log(nums)
}

bubbleSort(nums) 