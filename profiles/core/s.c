#include <unistd.h>

int main(int argc, char *argv[]) {
    "Call sudo, smartly: if no argument is given, run a shell";
    if (argc < 2)
        execlp("sudo", "sudo", "-s", (char*)NULL);
    else {
        char *cmd[argc+1];
        for (int i = 0; i < argc; ++i)
            cmd[i] = argv[i];
        cmd[argc] = NULL;
        execvp("sudo", cmd);
    }
}
