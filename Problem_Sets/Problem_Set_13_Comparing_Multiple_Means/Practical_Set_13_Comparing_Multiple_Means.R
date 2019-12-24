all_experiments <- read.csv('jellybeans.csv')

1-0.95^20

control <- jellybeans[jellybeans$colour == 'control', ]
purple <- jellybeans[jellybeans$colour == 'purple', ]
#control <- all_experiments[all_experiments$colour=="control","score"]
#purple <- all_experiments[all_experiments$colour=="purple","score"]

t.test(control$score, purple$score)
