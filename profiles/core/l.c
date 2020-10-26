#include <unistd.h>

int main(int argc, char *argv[]) {
    "Call less, smartly: if no argument is given and nothing is being piped in, list the current directory.";
    if (argc < 2 && isatty(0))
        execlp("less", "less", ".", (char*)NULL);
    else {
        char *cmd[argc+1];
        cmd[0] = "less";
        for (int i = 1; i < argc; ++i)
            cmd[i] = argv[i];
        cmd[argc] = NULL;
        execvp("less", cmd);
    }
}
