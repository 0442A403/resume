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
      && echo -e "\n\n\n\n\n\n\n\n\n" | pdflatex cv-llt -interaction=nonstopmode \
      && biber cv-llt \
      && echo -e "\n\n\n\n\n\n\n\n\n" | pdflatex cv-llt -interaction=nonstopmode \
      | echo "Pdf is waiting for you"

CMD [ "/bin/bash" ]
