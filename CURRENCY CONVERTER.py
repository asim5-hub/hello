import tkinter
import requests

def convert_currency():
    base_currency = base_currency_entry.get().upper()
    target_currency = target_currency_entry.get().upper()
    try:
        amount = float(amount_entry.get())
    except ValueError:
        result_entry.delete(0, tkinter.END)
        result_entry.insert(0, "Invalid amount")
        return

    url = f'https://api.exchangerate-api.com/v4/latest/{base_currency}'
    response = requests.get(url)
    data = response.json()

    try:
        exchange_rate = data["rates"][target_currency]
        converted_amount = amount * exchange_rate
        result_entry.delete(0, tkinter.END)  
        result_entry.insert(0, f"{converted_amount:.2f}") 
    except KeyError:
        result_entry.delete(0, tkinter.END)
        result_entry.insert(0, "Invalid currency code")

window = tkinter.Tk()
window.title("Currency Converter")
window.geometry('400x200')
window.config(bg="#ffffc5")

base_currency_label = tkinter.Label(window, text="Base Currency",font=("Arial", 10, "bold"),bg="blue",fg="white")
base_currency_label.pack()
base_currency_entry = tkinter.Entry(window)
base_currency_entry.pack()

target_currency_label = tkinter.Label(window, text="Target Currency",font=("Arial", 10, "bold"),bg="blue",fg="white")
target_currency_label.pack()
target_currency_entry = tkinter.Entry(window)
target_currency_entry.pack()

amount_label = tkinter.Label(window, text="Amount",font=("Arial", 10, "bold"),bg="blue",fg="white")
amount_label.pack()
amount_entry = tkinter.Entry(window)
amount_entry.pack()

result_label = tkinter.Label(window, text="Result",font=("Arial", 10, "bold"),bg="blue",fg="white")
result_label.pack()
result_entry = tkinter.Entry(window)
result_entry.pack()

convert = tkinter.Button(window, text="Convert Currency",font=("Arial", 10, "bold"), command=convert_currency,bg="green",fg="white")
convert.pack()

window.mainloop()
