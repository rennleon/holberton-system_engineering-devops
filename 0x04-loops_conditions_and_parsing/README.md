# 0x04. Loops, conditions and parsing
In this project I learned about the shell script, using `while`,`until`, `for` loops, `if` statements and used some commands like `cut`, `set` and `awk` to achieve the proposed tasks

*Useful links*
- [Loops sample](https://intranet.hbtn.io/rltoken/XnVjFM8a1W4RfRu4TCPY-g)
- [Variable assignment and arithmetic](https://intranet.hbtn.io/rltoken/IM0Gv6VPzwAmqzlJxETZkw)
- [Comparison operators](https://intranet.hbtn.io/rltoken/K3E6xI9-goDM-93vsjCpPA)
- [File test operators](https://intranet.hbtn.io/rltoken/0OZLLDT28KrRZdid-l6hwg)
- [Make your scripts portable](https://intranet.hbtn.io/rltoken/Dyrnap2UC-LrzrmCOJRx8A)

### [Shellcheck](https://intranet.hbtn.io/rltoken/E7Pr2zeM3cdY5-C0HKwtbw)
> Is a tool that will help you write proper Bash scripts. It will make recommendations on your syntax and semantics and provide advice on edge cases that you might not have thought about. Shellcheck is your friend! here is how to [install it](https://intranet.hbtn.io/rltoken/SOX0HZTMgzHbcxrvU1X4hw)

## Tasks
### 0. Create a SSH RSA key pair
Create a RSA key pair
*File:* [0-RSA_public_key.pub](0-RSA_public_key.pub)

### 1. For Holberton School loop
Write a Bash script that displays `Holberton School` 10 times.
**Requirements:**
- Must use the for loop
- The first line of my Bash script starts with `#!/usr/bin/env bash`
*File :* [1-for_holberton_school](1-for_holberton_school)

### 2. While Holberton School loop
Write a Bash script that displays `Holberton School` 10 times.
**Requirements:**
- You must use the `while` loop
*File:* [2-while_holberton_school](2-while_holberton_school)

### 3. Until Holberton School loop
Write a Bash script that displays `Holberton School` 10 times.
**Requirements:**
You must use the until loop (for and while are forbidden)
*File: * [3-until_holberton_school](3-until_holberton_school)

### 4. If 9, say Hi!
Write a Bash script that displays `Holberton School` 10 times, but for the 9th iteration, displays `Holberton School` and then `Hi` on a new line.
`Requirements:`
You must use the `while` loop
You must use the `if` statement
*File: * [4-if_9_say_hi](4-if_9_say_hi)

### 5. 4 bad luck, 8 is your chance
Write a Bash script that loops from 1 to 10 and:
- displays `bad luck` for the 4th loop iteration
- displays `good luck` for the 8th loop iteration
- displays `Holberton School` for the other iterations
**Requirements:**
You must use the `while` loop
You must use the `if`, `elif` and `else` statements
*File: * [5-4_bad_luck_8_is_your_chance](5-4_bad_luck_8_is_your_chance)

### 6. Superstitious numbers
Write a Bash script that displays numbers from 1 to 20 and:
- displays `4` and then `bad luck from China` for the 4th loop iteration
- displays `9` and then `bad luck from Japan` for the 9th loop iteration
- displays `17` and then `bad luck from Italy` for the 17th loop iteration
**Requirements:**
- Must use the `while` loop
- Must use the `case` statement
*File: * [6-superstitious_numbers](6-superstitious_numbers)

### 7. Clock
Write a Bash script that displays the time for 12 hours and 59 minutes:
- display hours from 0 to 12
- display minutes from 1 to 59
**Requirements:**
- Must use the `while` loop
*File: * [7-clock](7-clock)

### 8. For ls
Write a Bash script that displays:
- The content of the current directory
- In a list format
- Where only the part of the name after the first dash is displayed (refer to the example)
**Requirements:**
- You must use the `for` loop
- Do not display hidden files
*File: * [8-for_ls](8-for_ls)

### 9. To file, or not to file
Write a Bash script that gives you information about the `holbertonschool` file.
**Requirements:**
- Must use `if` and, `else`
- Bash script should check if the file exists and print:
 - if the file exists: `holbertonschool file exists`
 - if the file does not exist: `holbertonschool file does not exist`
- If the file exists, print:
 - if the file is empty: `holbertonschool file is empty`
 - if the file is not empty: `holbertonschool file is not empty`
 - if the file is a regular file: `holbertonschool is a regular file`
 - if the file is not a regular file: (nothing)
*File: * [9-to_file_or_not_to_file](9-to_file_or_not_to_file)

### 10. FizzBuzz
Write a Bash script that displays numbers from 1 to 100.
**Requirements:**
- Displays `FizzBuzz` when the number is a multiple of 3 and 5
- Displays `Fizz` when the number is multiple of 3
- Displays `Buzz` when the number is a multiple of 5
- Otherwise, displays the number
- In a list format
*File: * [10-fizzbuzz](10-fizzbuzz)

