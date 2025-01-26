# Kinoblue

My personal Fedora Kinoite + Silverblue image

## Features

- Based on Fedora 41 and Universal Blue
- Provides a KDE Plasma environment with GNOME apps
- Applies my [dotfiles](https://git.gay/max/dotfiles)
- Makes AppImages work out of box
- Uses Inter and Cascadia Code as the UI fonts

## Running the image

### Rebasing to this image

> [!NOTE]
> 
> This section is to be filled out.

### Creating an ISO

> [!TIP]
> 
> This image updates VERY OFTEN. Run `rpm-ostree upgrade` regularly.

```sh
sudo docker run --rm --privileged --volume .:/build-container-installer/build --security-opt label=disable --pull=newer \
    ghcr.io/jasonn3/build-container-installer:latest \
    IMAGE_REPO=ghcr.io/theycallhermax \
    IMAGE_NAME=kinoblue \
    IMAGE_TAG=latest \
    IMAGE_SIGNED=true \
    VERSION=41 \
    VARIANT=Silverblue
```

The output file will be `deploy.iso` file in the same directory you have ran the above command in.

## Testing the image

> [!CAUTION]
> 
> All of these instructions are **temporary storage** and are deleted when you shut down the container.

### Running in TTY mode

> [!CAUTION]
> 
> You're probably better off with running in GUI mode, as it lets you create a user.

```sh
docker pull ghcr.io/theycallhermax/kinoblue:latest
docker run --privileged -it ghcr.io/theycallhermax/kinoblue:latest /usr/lib/systemd/systemd rhgb --system --run-level 3
```

### Running in GUI mode

```sh
docker pull ghcr.io/theycallhermax/kinoblue:latest
docker run --privileged -it ghcr.io/theycallhermax/kinoblue:latest /usr/lib/systemd/systemd rhgb --system
```
