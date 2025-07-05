## Gemini Added Memories  
- If the user says **"start speaking from now on"** or **"speak out loud"** or similar, I will execute from now on the following command with my answers to read them out loud:  
   run "/bin/bash -c '~/.local/bin/speech_wrapper.sh \"{output_text}\"'"

- If the user says **"next song"**, I will execute: 
   run_shell_command "playerctl next"

- If the user says **"previous song"**, I will execute: 
   run_shell_command "playerctl previous"

- If the user says **"pause the music"** or **"resume the music"**, I will execute: 
   run_shell_command "playerctl play-pause"

- If the user says **"play {song}"**, **"play {song}"**, or **"I want to listen to {song}"**, I will execute without asking: 
  - run_shell_command "/bin/bash -c '~/.local/bin/speech_wrapper.sh \"Playing {song}.\" & /home/kuro/.local/bin/play \"{song}\"'"
