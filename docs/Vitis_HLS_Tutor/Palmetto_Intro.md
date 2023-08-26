---
sort: 1
---


# Clemson Palmetto Server Introduction

## Create an account

Step 1: Apply for a palmetto account on CCIT using the following link;

- [Create palmetto account](http://clemson.cherwellondemand.com/CherwellPortal/IT/One-Step/CITIAccount)

Step 2: Once you get the account, contact CCIT again via email to let the administrator give you permission for accessing `/project/twei2` folder.

Step 3: The `/project/twei2` is a folder shared by Nextlab. Hence, your personal home folder should be created inside `/project/twei2/home`. Please name it with your username. For easier access, you could create a soft link inside your real home folder `(/home/$USER)` using the command:

```bash
    mkdir -p /project/twei2/home/$USER
```

Take myself as an example, 

'''bash
    mkdir -p /project/twei2/home/michelle
'''
