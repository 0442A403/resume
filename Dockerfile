FROM debian:10.3

COPY ./CV /resume

RUN apt-get update && apt-get install -y \
      texlive-fonts-recommended \
      texlive-generic-recommended \
      texlive-latex-extra \
      texlive-fonts-extra \
      dvipng \
      texlive-latex-recommended \
      texlive-base \
      texlive-pictures \
      texlive-lang-cyrillic \
      texlive-science \
      cm-super \
      texlive-generic-extra \
      biber

RUN cd resume \
      && pdflatex -interaction=nonstopmode english \
      && biber english \
      && pdflatex -interaction=nonstopmode english

RUN cd resume \
      && pdflatex -interaction=nonstopmode russian \
      && biber russian \
      && pdflatex -interaction=nonstopmode russian

CMD [ "/bin/bash" ]
