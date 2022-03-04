<?php

require('../fpdf183/fpdf.php');
require ('modelo/BD.php');
require ('modelo/Empleado.php');
require('modelo/Factura.php');
require('modelo/LineaFactura.php');
require ('modelo/ListaLineasFactura.php');

// DECLARACIÓN DE LAS VARIABLES

// Este objeto Empleado sera el empleado que atendio la TPV
$empleado = new Empleado();
$empleado->obtenerPorIdEmpleado(1);
/*
// Creo la factura y la obtengo de la bd
$factura = new Factura();
$factura->obtenerPorIdFactura(1);

// Obtengo las lineas de la factura mediante una clase que contiene un array
$listaLineasFactura = new ListaLineasFactura();
$listaLineasFactura->obtenerListaLineasFacturas($factura->getNumeroFactura());

*/
// Creo el objeto pdf que me servira para generar la factura
$pdf = new FPDF();
$pdf->SetTitle("FACTURA", true);
$pdf->AddPage();
$pdf->SetAutoPageBreak(true, 1);
$pdf->Image('./Pag/Testo-HTML/HTML/images/logo-01.png',10,10,90);

// ME QUEDA OBTENER LA HOJA Y EL ALBARAN, Y CREAR EL FORMULARIO

// TITULO
$pdf->SetFont('Arial', 'B', 15);
$pdf->Ln(10);

// DATOS DE LA EMPRESA Y EL CLIENTE

$pdf->Cell(120);
$pdf->Cell(100, 10, utf8_decode("Madrid, Sol, CP 90036"), 0, 1, 'L', 0);
$pdf->Cell(120);
$pdf->Cell(100, 10, utf8_decode("Llámanos: 789-654-3210"), 0, 1, 'L', 0);
$pdf->Cell(120);
$pdf->Cell(100, 10, utf8_decode("Email: testo@testomail.com"), 0, 1, 'L', 0);

$pdf->Ln(20);

$pdf->SetFont('Arial', 'B', 15);

// DATOS DE LA FACTURA
$pdf->Cell(8);
$pdf->Cell(125, 10, utf8_decode("TIQUET T001/48344"), 0, 0, 'L', 0);
$pdf->Cell(100, 10, utf8_decode("FECHA 04/03/2022"), 0, 1, 'L', 0);

$pdf->Ln(5);

$pdf->SetFont('Arial', 'B', 24);
$pdf->Cell(8);
$pdf->Cell(150, 10, utf8_decode("MESA 1"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', 'B', 15);
$pdf->Cell(20, 10, utf8_decode("10:56:33"), 0, 1, 'L', 0);


/*
$pdf->Cell(120, 10, utf8_decode(" Número: ".$factura->getNumeroFactura()), 'LT', 0, 'L', 0);
$pdf->Cell(70, 10, utf8_decode(" Fecha:  ".$factura->getFechaFactura()), 'TR', 1, 'L', 0);
$pdf->Cell(120, 10, utf8_decode(" Forma de pago: ".$factura->getFormaPago()), 'LB', 0, 'L', 0);
$pdf->Cell(70, 10, utf8_decode(" Plazo para el pago:  ".$factura->getDiasPlazoPago() . " día"), 'BR', 1, 'L', 0);

$pdf->Ln(5);
$pdf->SetFont('Arial', 'B', 12);


// TABLA DE LA FACTURA

// Variables para los tamaños
$widthConcepto = 88;
$widthCantidad = 30;
$widthPrecioUnidad = 34;
$widthImporte = 37;

// Aqui establezco los títulos
$pdf->Cell(80);
$pdf->Cell(30,10, utf8_decode('LISTA DE ARTÍCULOS'),0,0,'C');
$pdf->Ln(15);

$pdf->Cell($widthConcepto, 10, utf8_decode("Concepto"), 1, 0, 'C', 0);
$pdf->Cell($widthCantidad, 10, utf8_decode("Cantidad"), 1, 0, 'C', 0);
$pdf->Cell($widthPrecioUnidad, 10, utf8_decode("Precio Unidad"), 1, 0, 'C', 0);
$pdf->Cell($widthImporte, 10, utf8_decode("Importe"), 1, 1, 'C', 0);



$pdf->SetFont('Arial', '', 12);

// Y aqui los datos de las filas de la factura

// CONCEPTO 1
$importeConcepto1 = $filaFactura1->getCantidad() * $filaFactura1->getPrecioUnidad();
$importeNetoConcepto1 = round($importeConcepto1 - (0.04*$importeConcepto1) - (0.02*($importeConcepto1-0.04*$importeConcepto1)) + (0.75*$filaFactura1->getCantidad()) + (17*3), 2);

$pdf->Cell($widthConcepto, 3, "", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 3, "", 'LR', 0, 'C', 0);
$pdf->Cell($widthPrecioUnidad, 3, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 3, "", 'LR', 1, 'R', 0);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell($widthConcepto, 10, $filaFactura1->getConcepto(), 'LR', 0, 'C', 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell($widthCantidad, 10, $filaFactura1->getCantidad()."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, $filaFactura1->getPrecioUnidad()." ".chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, $importeConcepto1." ".chr(128)."  ", 'LR', 1, 'R', 0);


$pdf->Cell($widthConcepto, 10, "Descuento comercial 4% (". $importeConcepto1 .")", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetTextColor(255,0,0);
$pdf->Cell($widthImporte, 10, "-". 0.04*$importeConcepto1." ".chr(128)."  ", 'LR', 1, 'R', 0);
$pdf->SetTextColor(0,0,0);

$pdf->Cell($widthConcepto, 10, "Dto. pronto pago 2% (1488 - 59,52)", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetTextColor(255,0,0);
$pdf->Cell($widthImporte, 10, "-". round(0.02*($importeConcepto1-0.04*$importeConcepto1), 2)." ".chr(128)."  ", 'LR', 1, 'R', 0);
$pdf->SetTextColor(0,0,0);

$pdf->Cell($widthConcepto, 10, "Envases (0,75/u)", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, $filaFactura1->getCantidad()."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "0,75 ".chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, 0.75*$filaFactura1->getCantidad()." ".chr(128)."  ", 'LR', 1, 'R', 0);


$pdf->Cell($widthConcepto, 10, utf8_decode("Palés (1/50L)"), 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, 3 ."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, 17 .chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, 17*3 ." ".chr(128)."  ", 'LR', 1, 'R', 0);


$pdf->Cell($widthConcepto, 10, "Importe neto " . $filaFactura1->getConcepto(), 'LR', 0, 'C', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'C', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell($widthImporte, 10, $importeNetoConcepto1." ".chr(128)."  ", 'LR', 1, 'R', 0);
$pdf->SetFont('Arial', '', 12);

$pdf->Cell($widthConcepto, 7, "", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 7, "", 'LR', 0, 'C', 0);
$pdf->Cell($widthPrecioUnidad, 7, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 7, "", 'LR', 1, 'R', 0);



// CONCEPTO 2
$importeConcepto2 = $filaFactura2->getCantidad() * $filaFactura2->getPrecioUnidad();
$importeNetoConcepto2 = round($importeConcepto2 - (0.05*$importeConcepto2) - (0.02 * ($importeConcepto2-(0.05*$importeConcepto2))) + (2.25*67) + (17*5), 2);


$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell($widthConcepto, 10, utf8_decode($filaFactura2->getConcepto()), 'LR', 0, 'C', 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell($widthCantidad, 10, $filaFactura2->getCantidad()."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, $filaFactura2->getPrecioUnidad()." ".chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, $importeConcepto2." ".chr(128)."  ", 'LR', 1, 'R', 0);



$pdf->Cell($widthConcepto, 10, "Descuento comercial 5% (". $importeConcepto2 .")", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetTextColor(255,0,0);
$pdf->Cell($widthImporte, 10, "-". round(0.05*$importeConcepto2, 2)." ".chr(128)."  ", 'LR', 1, 'R', 0);
$pdf->SetTextColor(0,0,0);


$pdf->Cell($widthConcepto, 10, "Dto. pronto pago 2% (". $importeConcepto2 ." - ". round(0.05*$importeConcepto2, 2) .")", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetTextColor(255,0,0);
$pdf->Cell($widthImporte, 10, "-". round(0.02 * ($importeConcepto2-(0.05*$importeConcepto2)), 2)." ".chr(128)."  ", 'LR', 1, 'R', 0);
$pdf->SetTextColor(0,0,0);


$pdf->Cell($widthConcepto, 10, "Unidades bonificadas (10L/250L)", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, 10 ."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "0,00 ".chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, "0,00 ".chr(128)."  ", 'LR', 1, 'R', 0);


$pdf->Cell($widthConcepto, 10, "Envases (2,25/u)", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, 67 ."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "2,25 ".chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, 2.25*67 ." ".chr(128)."  ", 'LR', 1, 'R', 0);



$pdf->Cell($widthConcepto, 10, utf8_decode("Palés (1/75L)"), 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, 5 ."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, 17 .chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, 17*5 ." ".chr(128)."  ", 'LR', 1, 'R', 0);



$pdf->Cell($widthConcepto, 10, utf8_decode("Importe neto ".$filaFactura2->getConcepto()), 'LR', 0, 'C', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell($widthImporte, 10, round($importeNetoConcepto2, 2)." ".chr(128)."  ", 'LR', 1, 'R', 0);
$pdf->SetFont('Arial', '', 12);


$pdf->Cell($widthConcepto, 10, "", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, "", 'LR', 1, 'R', 0);

// CONCEPTO 3
$importeConcepto3 = $filaFactura3->getCantidad() * $filaFactura3->getPrecioUnidad();
$importeNetoConcepto3 = round($importeConcepto3 - (0.04*$importeConcepto3) - (0.06*($importeConcepto3-0.04*$importeConcepto3)) - (0.02 * ($importeConcepto3 - ($importeConcepto3*0.04) - (0.06*($importeConcepto3-0.04*$importeConcepto3)))) + (0.75*$filaFactura3->getCantidad()) + (17*12),2);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell($widthConcepto, 10, $filaFactura3->getConcepto(), 'LR', 0, 'C', 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell($widthCantidad, 10, $filaFactura3->getCantidad()."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, $filaFactura3->getPrecioUnidad()." ".chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, $importeConcepto3." ".chr(128)."  ", 'LR', 1, 'R', 0);



$pdf->Cell($widthConcepto, 10, "Descuento comercial 4% (". $importeConcepto3 .")", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetTextColor(255,0,0);
$pdf->Cell($widthImporte, 10, "-". 0.04*$importeConcepto3." ".chr(128)."  ", 'LR', 1, 'R', 0);
$pdf->SetTextColor(0,0,0);


$pdf->Cell($widthConcepto, 10, "Descuento por rappel 6% (". $importeConcepto3 . " - " . ($importeConcepto3*0.04) .")", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetTextColor(255,0,0);
$pdf->Cell($widthImporte, 10, "-". round(0.06*($importeConcepto3-0.04*$importeConcepto3), 2)." ".chr(128)."  ", 'LR', 1, 'R', 0);
$pdf->SetTextColor(0,0,0);


$pdf->Cell($widthConcepto, 10, "Dto. pronto pago 2% (". $importeConcepto3 . " - " . ($importeConcepto3*0.04) . " - " . round(0.06*($importeConcepto3-0.04*$importeConcepto3), 2) . ")", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetTextColor(255,0,0);
$pdf->Cell($widthImporte, 10, "-". round( 0.02 * ($importeConcepto3 - ($importeConcepto3*0.04) - (0.06*($importeConcepto3-0.04*$importeConcepto3))), 2)." ".chr(128)."  ", 'LR', 1, 'R', 0);
$pdf->SetTextColor(0,0,0);


$pdf->Cell($widthConcepto, 10, "Envases (0,75/u)", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, $filaFactura3->getCantidad()."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "0,75 ".chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, 0.75*$filaFactura3->getCantidad()." ".chr(128)."  ", 'LR', 1, 'R', 0);


$pdf->Cell($widthConcepto, 10, utf8_decode("Palés (1/50L)"), 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 10, 12 ."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, 17 .chr(128)."  ", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 10, 17*12 ." ".chr(128)."  ", 'LR', 1, 'R', 0);



$pdf->Cell($widthConcepto, 10, "Importe neto " . $filaFactura3->getConcepto(), 'LR', 0, 'C', 0);
$pdf->Cell($widthCantidad, 10, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 10, "", 'LR', 0, 'R', 0);
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell($widthImporte, 10, round($importeNetoConcepto3, 2)." ".chr(128), 'LR', 1, 'R', 0);
$pdf->SetFont('Arial', '', 12);

$pdf->Cell($widthConcepto, 2, "", 'LR', 0, 'L', 0);
$pdf->Cell($widthCantidad, 2, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthPrecioUnidad, 2, "", 'LR', 0, 'R', 0);
$pdf->Cell($widthImporte, 2, "", 'LR', 1, 'R', 0);


$pdf->Cell(189, 10, "", 'T', 0, 0, 0);
$pdf->ln(8);

// CALCULO DE BI, IVA Y TOTAL
$baseImponible = $importeNetoConcepto1 + $importeNetoConcepto2 + $importeNetoConcepto3 + 245;
$cuotaTotalIva = round(  $importeNetoConcepto1*0.1 + $importeNetoConcepto2*0.04 + $importeNetoConcepto3*0.21 + 245*0.21, 2);


$pdf->Cell(72, 8, "El transporte tributa al 21% de iva", 0, 1, 'L', 0);
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(35, 10, utf8_decode("Base Imponible"), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(28, 10, $importeNetoConcepto1, 'TB', 0, 'C', 0);
$pdf->Cell(28, 10, $importeNetoConcepto2, 'TB', 0, 'C', 0);
$pdf->Cell(28, 10, $importeNetoConcepto3, 'TB', 0, 'C', 0);
$pdf->Cell(28, 10, "Tte. " . 245, 'TB', 0, 'C', 0);
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(42, 10, "Total " . $baseImponible . " " .chr(128), 1, 1, 'C', 0);
$pdf->SetFont('Arial', '', 12);

$pdf->Cell(35, 10, "IVA", 'LR', 0, 'C', 0);
$pdf->Cell(28, 10, "10%", 0, 0, 'C', 0);
$pdf->Cell(28, 10, "4%", 0, 0, 'C', 0);
$pdf->Cell(28, 10, "21%", 0, 0, 'C', 0);
$pdf->Cell(28, 10, "21%", 0, 0, 'C', 0);
$pdf->Cell(42, 10, "", 'LR', 1, 'C', 0);

$pdf->Cell(35, 10, "CUOTA", 'LR', 0, 'C', 0);
$pdf->Cell(28, 10, $importeNetoConcepto1*0.1, 0, 0, 'C', 0);
$pdf->Cell(28, 10, $importeNetoConcepto2*0.04, 0, 0, 'C', 0);
$pdf->Cell(28, 10, $importeNetoConcepto3*0.21, 0, 0, 'C', 0);
$pdf->Cell(28, 10, 245*0.21, 0, 0, 'C', 0);
$pdf->Cell(42, 10, $cuotaTotalIva, 'LR', 1, 'C', 0);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(129, 10, "TOTAL FACTURA", 'LTB', 0, 'R', 0);
$pdf->Cell(60, 10, $baseImponible + $cuotaTotalIva . " " . chr(128) . "  ", 'TRB', 1, 'R', 0);
$pdf->SetFont('Arial', '', 12);


$pdf->Ln(8);

$pdf->Ln(8);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(42, 10, utf8_decode("Observaciones"), 0, 1, 'L', 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(72, 8, utf8_decode($factura->getObservaciones()), 0, 0, 'L', 0);


$pdf->Ln(15);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(42, 10, utf8_decode("Anexo"), 0, 1, 'L', 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(72, 8, utf8_decode("Clausula de RGPD"), 0, 0, 'L', 0);
*/
$pdf->Output();
