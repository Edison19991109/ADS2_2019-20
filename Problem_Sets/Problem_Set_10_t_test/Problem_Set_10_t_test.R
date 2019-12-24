t.test(x = c(15, 30, 50), mu = 8.9)

t.test(x = c(102,340,234,332,129), y = c(74,56,70,104,11), alternative = 'greater', paired = TRUE)

gene_exp <- read.csv('week10_t_test_problemset_testdata.csv')
filter_gene <- c()
for (i in 1:dim(gene_exp)[1]) {
  result[i] <- t.test(x = gene_exp[i, c('naive_hESC_r1', 'naive_hESC_r2', 'naive_hESC_r3', 'naive_hESC_r4')],
                   y = gene_exp[i, c('primed_hESC_r1', 'primed_hESC_r2', 'primed_hESC_r3', 'primed_hESC_r4')], 
                   paired = FALSE)$p.value
}

filter_gene <- data.frame(gene_exp, result)
after_filter <- filter_gene[which(filter_gene$result<=0.05), ]
