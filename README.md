# Simple Pomodoro timer bash script


Requirements:
  sox and and you need to create a .env with SONG variable to the path of a song which will be played to indicate the break.
  EXAMPLE of .env file:
  ```
  SONG=/path/to/your/song.mp3
  ```

usecase:
```bash
./pomidoro.sh -w 600 -b 3000 -c 3
```

SYNOPSIS
  ./pomidoro.sh [-w seconds] [-b seconds] [-c times]

Description
  It's just a simple Pomodoro timer.
  If any or all inline arguments are missing then script will ask itself.
  -w seconds
    how long in seconds the Work should last.
  -b seconds
    how long in seconds the Break should last.
  -c 
    how many repetions should be
