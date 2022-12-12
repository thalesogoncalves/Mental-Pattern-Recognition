__author__ = 'thalesogoncalves'
from ctypes import cast

import turtle

import random

import math



__author__ = 'N59817'



wn = turtle.Screen()

t1 = turtle.Turtle()

wn.bgcolor('black')

t1.color('red')

t1.width(6)

t1.speed(10)



t1.penup()

t1.goto(-100,0)

t1.pendown()



t1.fill(True)

t1.setheading(270)

t1.forward(350)

t1.right(90)

t1.forward(300)

t1.right(90)

t1.forward(500)

t1.right(90)

t1.forward(150)

t1.right(45)

t1.forward(150 * math.sqrt(2))

t1.fill(False)



t1.penup()

t1.goto(100,0)

t1.pendown()



t1.fill(True)

t1.setheading(90)

t1.forward(350)

t1.right(90)

t1.forward(300)

t1.right(90)

t1.forward(500)

t1.right(90)

t1.forward(150)

t1.right(45)

t1.forward(150 * math.sqrt(2))

t1.fill(False)



t1.width(1)



t1.penup()

t1.goto(-310,155)

t1.setheading(90)

t1.color('white')

t1.write("Start", font=("Comic Sans MS", 12, "bold"))

t1.forward(20)

t1.pendown()



for _ in range(2):

    for _ in range(10):

        if t1.color() == ('gray', 'gray'):

            t1.color('white')

        else:

            t1.color('gray')

        t1.fill(True)

        for _ in range(4):

            t1.forward(10)

            t1.left(90)

        t1.fill(False)

        t1.forward(12)

    t1.penup()

    t1.right(90)

    t1.forward(12)

    t1.left(90)

    t1.backward(10*12)

    t1.pendown()

    if t1.color() == ('gray', 'gray'):

        t1.color('white')

    else:

        t1.color('gray')



t1.penup()

t1.goto(290,-175)

t1.setheading(270)

t1.color('white')

t1.write("Finish", align="right", font=("Comic Sans MS", 12, "bold"))

t1.pendown()



for _ in range(2):

    for _ in range(10):

        if t1.color() == ('gray', 'gray'):

            t1.color('white')

        else:

            t1.color('gray')

        t1.fill(True)

        for _ in range(4):

            t1.forward(10)

            t1.left(90)

        t1.fill(False)

        t1.forward(12)

    t1.penup()

    t1.left(90)

    t1.forward(12)

    t1.right(90)

    t1.backward(10*12)

    t1.pendown()

    if t1.color() == ('gray', 'gray'):

        t1.color('white')

    else:

        t1.color('gray')



t1.penup()

t1.goto(-310,155 + 20+5*12)

t1.setheading(0)

t1.color('blue')

t1.speed(1)

t1.pendown()





dado = file('Classe.txt').read()

while True:

    try:

        if dado[0] == '1':

            t1.left(1)

        if dado[0] == '2':

            t1.forward(1)

        if dado[0] == '3':

            t1.right(1)

    except IndexError:

        dado = file('Classe.txt').read()

    finally:

        for _ in range(1000):

            for _ in range(80):

                x = 1

        dado = file('Classe.txt').read()


#wn.exitonclick()
