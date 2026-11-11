# Mantenimiento AR

Prototipo académico de una app iOS para consultar instrucciones de mantenimiento de un equipo, con visor 3D interactivo, guía paso a paso y visualización en realidad aumentada.

## Funcionalidades
- Catálogo de equipos y sus piezas (datos en JSON local)
- Visor 3D con RealityKit: rotación y resaltado de la pieza seleccionada
- Mantenimiento guiado: cada paso resalta su pieza en el modelo
- Realidad aumentada: el modelo aparece frente a la cámara y se puede
  girar y escalar con gestos
- Manejo de errores de carga, con mensaje visible al usuario

## Tecnologías
Swift, SwiftUI, RealityKit, Reality Composer Pro 3, arquitectura MVVM.

## Arquitectura
JSON → Service → ViewModel → View

- `Models`: Equipo, Pieza, Instruccion (Codable)
- `Services`: lectura del JSON, detrás de un protocolo
- `ViewModels`: estado de pantalla y errores
- `Views`: catálogo, equipo, pieza, visor 3D, mantenimiento y AR

## Requisitos
- Xcode 27.0
- iOS 18.6 o superior
- La AR requiere un iPhone o iPad físico; el simulador no tiene cámara

## Cómo ejecutarlo
1. Clona el repositorio.
2. Abre `mantenimientoAR-etpsiv.xcodeproj` en Xcode.
3. Elige un dispositivo o simulador y presiona Cmd + R.

## Limitaciones
- Los equipos y procedimientos son **demostrativos** y no sustituyen las
  indicaciones del fabricante.
- En AR, el modelo se coloca en un punto fijo frente a la cámara; no
  detecta superficies ni reconoce el equipo real.
- La identificación del equipo es manual, desde el catálogo.

## Trabajo futuro
Anclaje a superficies reales, reconocimiento del equipo por cámara o QR, y resaltado de la pieza del paso actual dentro de la AR.

## Autoría
David Chavez · ETPS-4 · UTEC · Ciclo X/2026

