Nemo has an attempt to remote ssh but it is not completely remote and doesn't work properly.

![image](https://user-images.githubusercontent.com/79611386/184952778-788c9a0d-73d4-4ef7-a3e2-42fee8a2d60e.png)

Firstly, you need to login in your sftp server via nemo file manager and save login password.
Then, you need to execute this command to install and set dependencies: 
```bash
sudo apt install sshpass && sudo apt install libsecret-tools && git clone https://github.com/tzukav/mint-nemo-remote-terminal.git && mv mint-nemo-remote-terminal/* ~/.local/share/nemo/actions/ && rm -rf mint-nemo-remote-terminal
```
And that's it, now you have auto ssh login directly in your nemo file manager.
