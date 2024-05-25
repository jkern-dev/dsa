def binarySearch(arr, target):
    if (len(arr) == 1 and target != arr[0]):
        return False 
    else:
        mid_idx = round(len(arr) / 2)
        left_arr = arr[:mid_idx]
        right_arr = arr[mid_idx:]
        if target < arr[mid_idx]:
            return binarySearch(left_arr,target)
        elif target > arr[mid_idx]:
            return binarySearch(right_arr,target)
        else:
            return True 


print(binarySearch([12,15,20,22,25,30],20)) # True 
print(binarySearch([5, 10, 12, 15, 20, 30, 70], 12)) # True 
print(binarySearch([5, 10, 12, 15, 20, 30, 70], 24)) # False