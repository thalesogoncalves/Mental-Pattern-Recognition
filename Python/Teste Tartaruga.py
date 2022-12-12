__author__ = 'thalesogoncalves'

import turtle

wn = turtle.Screen()

t1 = turtle.Turtle()

wn.bgcolor('black')
t1.color('white')
t1.shape('turtle')

t1.forward(100)
t1.left(135)
t1.forward(250)
t1.right(45)

wn.exitonclick()