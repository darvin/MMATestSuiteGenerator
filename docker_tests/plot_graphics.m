#!/usr/local/bin/wolfram -script

Export["docker_tests/plot_graphics_output.png", Plot[{Sin[x], Sin[2 x], Sin[3 x]}, {x, 0, 2 Pi},                                                                       
        PlotLegends -> "Expressions"]];


