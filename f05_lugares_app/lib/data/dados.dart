import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:flutter/material.dart';

const paises = const [
  Pais(
    id: 'c1',
    titulo: 'Estados Unidos',
    cor: Colors.purple,
  ),
  Pais(
    id: 'c2',
    titulo: 'Canada',
    cor: Colors.red,
  ),
  Pais(
    id: 'c3',
    titulo: 'Suiça',
    cor: Colors.orange,
  ),
  Pais(
    id: 'c4',
    titulo: 'Chile',
    cor: Colors.amber,
  ),
  Pais(
    id: 'c5',
    titulo: 'Espanha',
    cor: Colors.amber,
  ),
  Pais(
    id: 'c6',
    titulo: 'Peru',
    cor: Colors.lightBlue,
  ),
  Pais(
    id: 'c7',
    titulo: 'Brasil',
    cor: Colors.lightGreen,
  ),
  Pais(
    id: 'c8',
    titulo: 'Egito',
    cor: Colors.teal,
  ),
];

const lugares = const [
  Lugar(
    id: 'p1',
    titulo: 'Praia',
    paises: ['c8', 'c5', 'c9','c7'],
    avaliacao: 4.8,
    custoMedio: 20,
    recomendacoes: [
      '1. Leve protetor solar',
      '2. Se hidrate',
      '3. Não jogue lixo na praia',
      '4. Tome água de coco'
    ],
    imagemUrl:
        'https://s2.glbimg.com/Qgl26Ze8x7iJ1HoFwwRkwfjgGrM=/smart/e.glbimg.com/og/ed/f/original/2020/11/05/brasil-tem-duas-praias-entre-as-cinco-melhores-do-mundo.jpg',
  ),
  Lugar(
    id: 'p2',
    titulo: 'Montanha',
    paises: ['c1', 'c2', 'c4', 'c3'],
    avaliacao: 4.2,
    custoMedio: 50,
    recomendacoes: [
      '1. Leve tenis para hiking',
      '2. Levar kit de primeiros socorros',
      '3. Roupa para frio'
    ],
    imagemUrl:
        'https://images.memphistours.com/large/60e4be05c4ef4373c71802b0dd3f9e62.jpg',
  ),
  Lugar(
    id: 'p3',
    titulo: 'Deserto',
    paises: ['c10', 'c4'],
    avaliacao: 4.1,
    custoMedio: 20,
    recomendacoes: [
      '1. Leve protetor solar',
      '2. Leva uma reserva de água',
      '3. roupas de lã'
    ],
    imagemUrl:
        'https://s4.static.brasilescola.uol.com.br/be/2021/11/deserto.jpg',
  ),
  Lugar(
    id: 'p4',
    titulo: 'Monumentos Antigos',
    paises: ['c10', 'c5', 'c6'],
    avaliacao: 4.7,
    custoMedio: 45,
    recomendacoes: [
      '1. Tenis leve para caminhada',
      '2. Procure um guia',
      '3. Contribua para preservação'
    ],
    imagemUrl:
        'https://img.freepik.com/fotos-gratis/tiro-de-angulo-baixo-dos-antigos-pilares-de-pedra-grega-com-um-ceu-azul-claro_181624-2890.jpg',
  ),
  Lugar(
    id: 'p5',
    titulo: 'Monumentos Modernos',
    paises: ['c1'],
    avaliacao: 4.2,
    custoMedio: 30,
    recomendacoes: [
      '1. Tenis leve para caminhada',
      '2. Passeios em grupo',
    ],
    imagemUrl:
        'https://www.infoescola.com/wp-content/uploads/2009/03/estatua-da-liberdade.jpg',
  ),
  Lugar(
    id: 'p6',
    titulo: 'Maravilhas da Natureza',
    paises: ['c2', 'c8', 'c7'],
    avaliacao: 4.4,
    custoMedio: 40,
    recomendacoes: [
      '1. Tenis leve para caminhada',
      '2. Passeios em grupo e com guia',
      '3. Contribua para preservação'
    ],
    imagemUrl:
        'https://img.freepik.com/fotos-gratis/cachoeira-do-parque-nacional-do-iguacu-cercada-por-florestas-cobertas-pela-nevoa-sob-um-ceu-nublado_181624-14415.jpg',
  ),
];