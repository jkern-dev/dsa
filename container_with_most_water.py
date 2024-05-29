def maxArea(self, height):
    left_idx = 0
    right_idx = len(height) - 1
    max_area = 0
    while left_idx < right_idx:
        width = right_idx - left_idx
        left_h = height[left_idx]
        right_h = height[right_idx]
        min_height = min(left_h, right_h)
        area = width * min_height
        max_area = max(area, max_area)
        if left_h <= right_h:
            left_idx += 1
        else:
            right_idx -= 1
    return max_area

print(maxArea([1,8,6,2,5,4,8,3,7]))