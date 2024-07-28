from textual.app import App
from textual.widget import Widget
from textual.widgets import Header, Footer

class MainWidget(Widget):
    def render(self):
        return "Hello, Textual!"

class MyApp(App):
    def compose(self):
        yield Header()
        yield MainWidget()
        yield Footer()

if __name__ == "__main__":
    MyApp.run()
