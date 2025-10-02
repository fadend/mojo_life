from gridv1 import Grid
from python import Python
import time

def run_display(var grid: Grid) -> None:
    rich_console = Python.import_module("rich.console")
    console = rich_console.Console()
    while True:
        console.clear()
        console.print(String(grid).replace("*", ":green_square:").replace(" ", ":black_large_square:"))
        # Pause for 0.5 seconds.
        time.sleep(0.1)
        grid = grid.evolve()

def main():
    run_display(Grid.random(30, 30))

