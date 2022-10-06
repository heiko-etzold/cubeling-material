# Change these setting for your language and version

language <- "de"

title <- "Klötzchen -- Leitfaden für Lehrerinnen und Lehrer"
shortTitle <- "Klötzchen-Leitfaden"
description <- "Anleitung zur Bedienung der Klötzchen-App und Handreichung für ihren Einsatz im Mathematikunterricht"

versionText <- "Version"
guideVersion <- "3.0"
appVersion <- "7.1"
optimizedTextA <- "; optimiert für Version "
optimizedTextB <- " der Klötzchen-App"

authors <- "Heiko Etzold, Lena Holzwarth, Mario Reindl, Jessica Schon"
authorsForCitation <- "Etzold, H., Holzwarth, L., Reindl, M., & Schon, J."
citeText <- "zitiere als"
gitHubName <- "heiko-etzold"
gitHubProject <- "cubeling-material"



# Keep these settings and run the hole R file

filePath<-file("index.Rmd")
file.create(filePath)

# sprintf
sink(filePath)
cat("---\n")
cat(sprintf("title: \"%s\"\n",title))
cat(sprintf("description: \"%s\"\n",description))
cat(sprintf("author: \"%s\"\n",authors))
cat(sprintf("date: |\n  %s %s, \`r format(Sys.time(), '%%B %%Y')\`%s%s%s\n\n", versionText, guideVersion, optimizedTextA, appVersion, optimizedTextB))
cat("  <div style=\"font-style: normal\">\n")
cat(sprintf("    > %s: %s (\`r format(Sys.time(), '%%Y')\`). *%s* (%s %s). <a href=\"https://%s.github.io/%s/%s/%s\">https\\://%s.github.io/%s/%s/%s</a></div>\n", citeText, authorsForCitation, title, versionText, guideVersion, gitHubName, gitHubProject, language, guideVersion, gitHubName, gitHubProject, language, guideVersion))



cat("site: bookdown::bookdown_site\n")
cat("output:\n")
cat("  bookdown::gitbook:\n")
cat("    config:\n")
cat("      toc:\n")
cat("        before:\n")
cat(sprintf("          <li><a href=\"index.html\"><b>%s</b></a></li>\n",shortTitle))
cat("        after:\n")
cat("          <li><a href=\"https://creativecommons.org/licenses/by-sa/4.0/\"><img src=\"pictures/by-sa.png\" height=\"20px\"/></a></li>\n")
cat("      sharing:\n")
cat("        facebook: false\n")
cat("        twitter: false\n")
cat("        all: false\n")
cat("        github: true\n")
cat("      info: false\n")
cat("    css: \"own.css\"\n")
cat("    split_bib: false\n")
cat("documentclass: book\n")
cat(sprintf("github-repo: \"%s/%s/tree/%s.%s\"\n",gitHubName, gitHubProject, language, guideVersion))
cat("bibliography: \"references.bib\"\n")
cat("csl: \"apa.csl\"\n")
cat("link-citations: yes\n")
cat(sprintf("url: \"https://%s.github.io/%s/%s/%s\"\n",gitHubName, gitHubProject, language, guideVersion))

cat("---\n")
sink()
close(filePath)



yamlFilePath<-file("_bookdown.yml")
file.create(yamlFilePath)
sink(yamlFilePath)
cat(sprintf("view: \"https://github.com/%s/%s/blob/%s.%s/%%s\"\n", gitHubName, gitHubProject, language, guideVersion))
cat(sprintf("output_dir: \"docs/%s/%s\"\n", language, guideVersion))
cat("language:\n")
cat("  label:\n")
cat("    fig: 'Abb. '\n")

sink()
close(yamlFilePath)



