# Day 11: PowerShell Remoting

PowerShell Remoting allows you to run commands on remote computers. It's built on top of **WSMan (Windows Remote Management)** and **SSH**.

---

## What Can You Do With Remoting?

- Administer remote servers without RDP or logging in.
- Run one-time or persistent remote sessions.
- Automate tasks across multiple machines.
- Securely manage systems over the network.

---

## Enable PowerShell Remoting (on the remote machine)

For Windows-based remoting (WinRM):

```powershell
Enable-PSRemoting -Force
```

- Starts the WinRM service.
- Sets up listeners and firewall exceptions.
- Run this on **each machine** you want to connect to.

>  Requires Administrator privileges.

---

## One-to-One Remote Command (Ad-Hoc)

```powershell
Invoke-Command -ComputerName REMOTE_PC -ScriptBlock { Get-Process }
```

You can also pass credentials:

```powershell
Invoke-Command -ComputerName REMOTE_PC -ScriptBlock { Get-Service } -Credential (Get-Credential)
```

---

## Persistent Sessions (PSSession)

### Create a session:

```powershell
$session = New-PSSession -ComputerName REMOTE_PC
```

### Run a command in that session:

```powershell
Invoke-Command -Session $session -ScriptBlock { hostname }
```

### Enter an interactive session:

```powershell
Enter-PSSession -ComputerName REMOTE_PC
```

Now you’re working *inside* the remote system like a shell.

### Exit session:

```powershell
Exit-PSSession
```

---

## Close Sessions

```powershell
Remove-PSSession $session
```

---

## Authentication & Permissions

- Make sure your user account has access on the remote machine.
- Domain environments work better out of the box.
- For workgroup setups, you may need to adjust **TrustedHosts** or use **SSH remoting**.

---

## Optional: Use SSH Instead of WinRM

If you're in a cross-platform environment (like managing Linux servers or macOS):

```powershell
Enter-PSSession -HostName remote.server.com -User admin -SSHTransport
```

---

## Tips

- Use `Invoke-Command` for batch jobs or scripts.
- Use `Enter-PSSession` for live, interactive tasks.
- Remoting works best when your network/firewall policies allow it.

---

## Practices

Try it locally (loopback):

```powershell
Enable-PSRemoting -Force

Invoke-Command -ComputerName localhost -ScriptBlock { Get-Date }
```

Then:

1. Try creating a session:  
   ```powershell
   $s = New-PSSession -ComputerName localhost
   ```

2. Run a command in it:  
   ```powershell
   Invoke-Command -Session $s -ScriptBlock { Get-Uptime }
   ```

3. Enter it interactively:
   ```powershell
   Enter-PSSession -Session $s
   ```


