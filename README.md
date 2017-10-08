# ECS-JAVA-EUREKA #

Base image for ECS Aware Eureka Instances

### Usage ###

The [ecs-java-eureka](https://bitbucket.org/RedSoftwareSystems/ecs-java-eureka) is a Docker image derived from the excellent and widely suggested
`frolvlad/alpine-oraclejdk8:slim` docker image: it adds python and some modules (nominally, boto, boto3 and requests ) and an entry point script.

The entry point expects the definition of a CMD inside the final (yours) docker definition. Following is an example docker definition:

    FROM redss/ecs-java-eureka:0.1-alpha
    VOLUME /tmp
    
    MAINTAINER Somebody <somebody@somewhere>
    
    ADD ./application.jar /app/
    RUN sh -c 'touch /app/application.jar'
    
    CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/application.jar"]
    
    EXPOSE port#
    
Python is needed to execute the included script (ecs-get-port-mapping.py) which retrieves
the ECS Host exposed ports. 

### Acknowledgements ###

The script is a gist from [Chris Smith](https://gist.github.com/chris-smith-zocdoc/126db78651046c67ac66dbd87393b1dc)

### Contact ###

Please contact lbotti@red.software.systems for info about this
project.
