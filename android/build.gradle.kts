buildscript {
    val kotlinVersion: String by extra("1.3.72")

    repositories {
        google()
        jcenter()
    }

    dependencies {
        classpath("com.android.tools.build:gradle:4.1.1")
        classpath(kotlin("gradle-plugin", version = kotlinVersion))
    }
}

allprojects {
    repositories {
        google()
        jcenter()
    }
}

rootProject.setBuildDir("../build")
subprojects {
    setBuildDir("${rootProject.buildDir}/${project.name}")
    evaluationDependsOn(":app")
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
