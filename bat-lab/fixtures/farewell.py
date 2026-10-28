#!/usr/bin/env python3
"""Print a short farewell message."""

NAMES = ["Ada", "Grace", "Edsger"]


def farewell(name):
    return f"Goodbye, {name}. Safe travels!"


def main():
    for name in NAMES:
        print(farewell(name))


if __name__ == "__main__":
    main()
