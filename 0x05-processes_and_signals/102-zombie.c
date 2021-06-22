#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/**
 * main - Creates 5 zombie processes
 *
 * Return: 0 on success, otherwise error code
*/
int main(void)
{
	int i;
	int child_pid;

	for (i = 0; i < 5; i++)
	{
		child_pid = fork();

		/* If an error happens while executing fork */
		if (child_pid == -1)
			exit(1);

		/* Check if is child process */
		if (child_pid == 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			exit(0);
		}
	}

	/* parent process */
	/* Infinite loop to keep the childs as zombies */
	while (1)
		sleep(1);

	return (0);
}
