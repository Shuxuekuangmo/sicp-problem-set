(car ''asd)
                                        ;quote
                                        ;上式的实际展开是:(car (quote (quote asd)))，所以结果是quote (quote asd)表达式被视为一个列表。
(car '(car a))
                                        ;car
