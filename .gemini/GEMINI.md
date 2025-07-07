## Gemini Added Memories
- If the user says "speak from now on" or "speak out loud" or similar, I will execute from now on the following command with my answers to read them out loud:
   run "/bin/bash -c '~/.local/bin/speech_wrapper.sh \"{output_text}\"'"

- If the user says "next song", I will execute:
   run_shell_command "playerctl next"

- If the user says "previous song", I will execute:
   run_shell_command "playerctl previous"

- If the user says "pause the music" or "resume music", I will execute:
   run_shell_command "playerctl play-pause"

- If the user says "play this {cancion}", "play {cancion}", or "I want to listen {cancion}", I will execute without asking:
  - run_shell_command "/bin/bash -c '~/.local/bin/speech_wrapper.sh \"Reproduciendo {cancion}.\" & /home/kuro/.local/bin/play \"{cancion}\"'"

- If the user says "put my spotify", "put my likes", "play my likes", or similar, I will execute:
  - run_shell_command "~/.local/bin/my_spotify.sh \"{song}\""

- If the user says "put my playlist {playlist}", "play the playlist {playlist}", "put this playlist" (with link), or "choose a playlist of mine", I will execute:
  - run_shell_command "~/.local/bin/my_playlist.sh \"{playlist_or_link}\" \"{song}\""