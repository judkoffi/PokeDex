package fr.pokedex;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.event.Observes;
import io.quarkus.runtime.ShutdownEvent;
import io.quarkus.runtime.StartupEvent;

@ApplicationScoped
public class AppLifecycleBean {

  void onStart(@Observes StartupEvent event) {}

  void onStop(@Observes ShutdownEvent event) {}

}
