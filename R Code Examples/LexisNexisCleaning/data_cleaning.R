library("LexisNexisTools")
LNToutput <- lnt_read(x = getwd())
head(meta_df, n = 3)
duplicates_df <- lnt_similarity(LNToutput = LNToutput,
                                threshold = 0.97)
duplicates_df <- duplicates_df[duplicates_df$rel_dist < 0.2]
LNToutput <- LNToutput[!LNToutput@meta$ID %in% duplicates_df$ID_duplicate, ]
meta_df <- LNToutput@meta
articles_df <- LNToutput@articles
paragraphs_df <- LNToutput@paragraphs
csv_docs <- lnt_convert(LNToutput, to = "csv")
write.csv(paragraphs_df, "paragraphs.csv", row.names = FALSE)
write.csv(meta_df, "meta.csv", row.names = FALSE)
write.csv(articles_df, "articles.csv", row.names = FALSE)
