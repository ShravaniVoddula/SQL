# Interviews







## Question
Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

Input Format

The following tables hold interview data:

Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, and name is the name of the hacker. 

Colleges: The college_id is the id of the college, and contest_id is the id of the contest that Samantha used to screen the candidates. 

Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose contest_id Samantha forgot, and college_id is the id of the college where the challenge was given to candidates. 

View_Stats: The challenge_id is the id of the challenge, total_views is the number of times the challenge was viewed by candidates, and total_unique_views is the number of times the challenge was viewed by unique candidates. 

Submission_Stats: The challenge_id is the id of the challenge, total_submissions is the number of submissions for the challenge, and total_accepted_submission is the number of submissions that achieved full scores.
 [Question Link](https://www.hackerrank.com/challenges/interviews/problem)

## Answer
**Language:** MySql Server

[Answer Link](https://github.com/ShravaniVoddula/SQL/blob/main/HackerRank/Hard/Interviews/Interviews.sql)

## Output
845 579 Rose 1987 580 1635 566 

858 1053 Angela 703 160 1002 384 

883 1055 Frank 1121 319 1217 338 

1793 2655 Patrick 1337 360 1216 412 

2374 2765 Lisa 2733 815 3368 904 
