# 0x19. Postmortem

<center>
![typo meme](./typo-meme.jpeg)
</center>

## Issue summary
Close to 10:00 hours of July 2nd some of our users encounter dificulties loading our website our team started receiving some calls from users that were online and suddently couldn't access to our platform the event was triggered at 10:05 by typo in the last actualization we made to our codebase, this bug caused that our website couldn't load properly and stopped with an error, thus causing the server to go down, the event was detected by the monitoring system at 10:07 which fired and alert notifying the development team, which started working on finding and fixoing the issue inmediately. This incident affected 36% of our users located in europe and asia.

## Timeline
- **09:50 UTC:** A new update was uploaded to our website code base
- **09:58 UTC:** Our support team started receiving som calls from users that were having isues loading our website
- **10:00 UTC:**  Our monitoring system fired an alert indicating that the website was down
- **10:01 UTC:** The team received the alert and started working to fix the issue
- **10:02 UTC:** The team run some tests and found out that the cause was a typo in a library name on an import statement
- **10:04 UTC:** The team fixed the bug and run tests to make sure that it was properly solved
- **10:06 UTC:** The fixed version of the code was uploaded to the server
- **10:08 UTC:** The website was up and runnig again

## Root cause and resolution
A new code base was uploaded and the reponsible for such task didn't run the tests before commiting his changes and uploading the code to production. After the problem was notified, the team run the tests to find the problem that caused the server going down, they discovered that it was just a typo the php file named `wp-settings.php` located in `/var/www/html/`, the issue that caused the problem was an invalid import due to a typo in the file extension of a module that was being imported, for instance the line that contained the typo was`require_once(ABSPATH . WPINC . '/class-wp-locale.phpp')`, knowing this, the team fixed the typo, then run the tests again uploaded the fixed version and then put the website back online.

## Corrective and preventing measures
After this incdent, the team automated the system control version to not allow uploas and merges of new code if the tests didn't passed, thus enforcing programmer to test their code before trying to upload to production.
- New processes were implemented to avoid automtinc merge and deploy to production environment
- A formative guide was given to ne employers to avoid similar issues
- New tests were created
- New updates to code were enforced to pass the tests
- Programmers were formed to write new tests for the features they developed
- The team implemented a new workflow using pull requests to review the code before merging