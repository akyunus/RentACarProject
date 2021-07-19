FROM mcr.microsoft.com/mssql/server
WORKDIR /dbscript
ENV SA_PASSWORD="RentACar_123-Password"
ENV ACCEPT_EULA="Y"
COPY . .
# RUN chmod +x /dbscript/dbimport.sh
CMD /bin/bash ./entrypoint.sh