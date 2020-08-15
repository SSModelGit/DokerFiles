# Usage of CompArch Docker image

It's a standard Docker image with `IVerilog`, `Verilator`, `GTKwave`, and the _MARS_ MIPS simulator installed, things which should be useful for people in Olin's CompArch. (It's also got Emacs installed.) There's a `.bashrc` file included in the home directory of the container, so refer to that for the aliases pre-included with the container. Acquire the Docker image by running this command:

`docker pull sswaminathan235/olin:comparch`

That should be enough to get started. For additional ease of use, a couple handy aliases are available to use in the `ca-dock-setup.sh` file. Just source that in terminal, and the following aliases will be usable:
- `ca-start`: Initializes the Docker image as a container the first time it is used. Compared to standard initialization, this alias will also mount a volume for storing work onto the container, located in the container at `/home/comparch/volume`. Additionally, it will:
  - Mount the home directory of the host machine and the device ports to the container in secure locations.
  - Give the container network access (to do updates and run commands like `wget`).
  - Most importantly, it will connect the display of the container to the host machine, letting GUI programs like `GTKwave` run without issue.
- `ca-run`: Restarts the container after it has already been initialized. This actually is the simple command `docker start -ai ca-work-20`, but it's easier to alias rather than rewrite every time.
- `ca-join`: Likewise, rather than run `docker exec -it` and so on to rejoin a running container session, it's been aliased as `ca-join`.

These commands aren't necessary, but the intent is that by structuring and running the Docker container in this manner, it's easier to avoid issues of accidentally deleting work, GUI opening, and host machine folder acccess.
