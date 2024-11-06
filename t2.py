from tkinter import *
from tkinter import ttk
# from tkinter import messagebox

window = Tk()
window.title("Welcome to UCCE2513 Mini Project")
window.geometry("400x200")


class LED:
    def __init__(self, parent: Widget, color: str) -> None:
        self.colorname = color
        self.label = ttk.Label(
            parent, text=self.colorname.title(), font=("Courier", 14)
        )

        self.combo = ttk.Combobox(
            parent, values=["ON", "OFF"], font=("Arial", 16), state="readonly"
        )
        self.combo.current(0)

        self.button = ttk.Button(parent, text="SEND", command=self._reportButton)
        self.buttonstyle = ttk.Style()
        buttonstylestring = f"{self.colorname}.{self.button.winfo_class()}"
        self.buttonstyle.configure(
            buttonstylestring, font=("Arial", 8), foreground=self.colorname.lower()
        )
        self.button.configure(style=buttonstylestring)

    def _reportButton(self) -> None:
        print(f"Turn {self.combo.get().lower()} {self.colorname.lower()} LED")

    def place(self, rowno: int) -> None:
        self.label.grid(column=0, row=rowno)
        self.combo.grid(column=1, row=rowno)
        self.button.grid(column=2, row=rowno)


class LEDGrid(ttk.Frame):
    def __init__(self, parent: Widget, *colors: str):
        super().__init__(parent)
        for i, color in enumerate(colors):
            LED(self, color).place(i)
        self.pack()


LEDGrid(window, "red", "green", "blue")

# box = messagebox.Message(window, title="hi", type="abortretryignore").show()
# print(box)


window.mainloop()
