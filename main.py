from menu.models import MenuList, MenuView

def test():
    print("Hello World")

Main_menu = MenuList(name="Main", description="Main Menu")
test_menuview = MenuView(test,"Tetst", Main_menu)

test_menuview()