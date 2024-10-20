##import tkinter
##from tkinter import messagebox 
##def computePrice():
##    userid = username_entry.get()
##    password = password_entry.get()
##
##    # You can add your own validation logic here
##    if userid == "admin" and password == "password":
##        messagebox.showinfo("Login Successful", "Welcome, Admin!")
##    else:
##        messagebox.showerror("Login Failed", "Invalid username or password")
##
##window=tkinter.Tk()
##window.title("login form")
##window.geometry('400x200')
##
##username_label=tkinter.Label(window,text="userid",background="black",foreground="white")
##username_label.pack()
##username_entry=tkinter.Entry(window)
##username_entry.pack()
##
##password_label=tkinter.Label(window,text="password",background="black",foreground="white")
##password_label.pack()
##password_entry=tkinter.Entry(window,show="*")
##password_entry.pack()
##
##
##
##login_button=tkinter.Button(window,text="login",command=computePrice,foreground="white",
##                            background="blue")
##login_button.pack()
##
##window.mainloop()




##import tkinter as tk
##from tkinter import messagebox
##
### Function to validate the login
##def validate_login():
##    userid = username_entry.get()
##    password = password_entry.get()
##
##    # You can add your own validation logic here
##    if userid == "admin" and password == "password":
##        messagebox.showinfo("Login Successful", "Welcome, Admin!")
##    else:
##        messagebox.showerror("Login Failed", "Invalid username or password")
##
### Create the main window
##parent = tk.Tk()
##parent.title("Login Form")
##
### Create and place the username label and entry
##username_label = tk.Label(parent, text="Userid:")
##username_label.pack()
##
##username_entry = tk.Entry(parent)
##username_entry.pack()
##
### Create and place the password label and entry
##password_label = tk.Label(parent, text="Password:")
##password_label.pack()
##
##password_entry = tk.Entry(parent, show="*")  # Show asterisks for password
##password_entry.pack()
##
### Create and place the login button
##login_button = tk.Button(parent, text="Login", command=validate_login)
##login_button.pack()
##
### Start the Tkinter event loop
##parent.mainloop()


##import tkinter
##from tkinter import messagebox
##
##def authentication():
##    userid=username_entry.get()
##    password=password_entry.get()
##    if userid=="asim" and password=="1234":
##        messagebox.showinfo("login successfuly","wlecome admin")
##    else:
##        messagebox.showerror("login failed","invalid userae or password")
##        
##window=tkinter.Tk()
##window.title("login form")
##window.geometry('400x300')
##
##username_label=tkinter.Label(window,text="userid")
##username_label.pack()
##
##username_entry=tkinter.Entry(window,show="*")
##username_entry.pack()
##
##password_label=tkinter.Label(window,text="password")
##password_label.pack()
##
##password_entry=tkinter.Entry(window,show="*")
##password_entry.pack()
##
##button=tkinter.Button(window,text="Login",command=authentication)
##button.pack()
##window.mainloop()




