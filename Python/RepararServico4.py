import paramiko

# I would use transport directly and create a new channel for each command. Then you can use something like:

def issue_command(transport, pause, command):
    chan = transport.open_session()
    chan.exec_command(command)

    buff_size = 1024
    stdout = ""
    stderr = ""

    while not chan.exit_status_ready():
        time.sleep(pause)
        if chan.recv_ready():
            stdout += chan.recv(buff_size)

        if chan.recv_stderr_ready():
            stderr += chan.recv_stderr(buff_size)

    exit_status = chan.recv_exit_status()
    # Need to gobble up any remaining output after program terminates...
    while chan.recv_ready():
        stdout += chan.recv(buff_size)

    while chan.recv_stderr_ready():
        stderr += chan.recv_stderr(buff_size)

    return exit_status, stdout, stderr

ssh = paramiko.SSHClient()
ssh.load_system_host_keys()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(host, port=22, username=username, password=password, timeout=3,)
transport = ssh.get_transport()
pause = 1    

resp1 = issue_command(transport, pause, cmd1)
resp2 = issue_command(transport, pause, cmd2)


An even better way would be to take a list of commands and spawn a new channel for each, poll each chan's recv_ready, and suck up their stdout/stderr when output is available. :-)

Edit: There are potential issues with reading data after the command exits. Please see the comments!