#include <stdlib.h>
#include <string.h>
#include <stdio.h>

char *
ccd_helloworld(char *name)
{
	int len;
	char *msg_pre = "Hello ";
	char *msg_post = ", this is a example reusable component to showcase automatic code pull, build and integration.";
	char *msg = {};

	len = strlen(msg_pre) + strlen(name) + strlen(msg_post);
	msg = malloc(len + 1);
	snprintf(msg, len, "%s%s%s", msg_pre, name, msg_post);

	return msg;
}
