# https://leetcode.com/problems/reverse-words-in-a-string/?envType=study-plan-v2&envId=leetcode-75
class Solution(object):
    def reverseWords(self, s):
        """
        :type s: str
        :rtype: str
        """
        arr = s.split(" ")
        res = []
        i = len(arr) - 1
        space = " "
        while i >= 0:
            if arr[i] == "":
                i -= 1
            else:
                res.append(arr[i])
                i -= 1
        res_str = space.join(res)
        return res_str.strip()
        
            
        