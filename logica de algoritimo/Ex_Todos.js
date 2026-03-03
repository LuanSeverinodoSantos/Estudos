
{
  let x = 0;
  let repeticoes = 0;

  while (repeticoes < 4) {
    console.log(`O valor de x e: ${x}`);
    x = x + 2;
    repeticoes++;
  }

  console.log(x);
}

// Ex_02
{
  let x = 10;

  for (let cont = 0; cont < 3; cont++) {
    x = x - 1;
    console.log(`O valor de x e: ${x}`);
  }
  console.log("O valor final do x e: " + x);
}

// Ex_03
{
  let x = 1;
  for (let i = 0; i < 5; i++) {
    x = x * 2;
    console.log("O valor de x e: " + x);
  }
  console.log("O valor final de x e: " + x);
}

// Ex_04
{
  let x = 0;
  let i = 1;

  while (i <= 3) {
    x = x + i;
    i = i + 1;

    console.log("Numero de iteracoes: " + (i - 1) + ", o valor de x e: " + x);
  }
}

// Ex_05
{
  let x = 5;

  if (x > 3) {
    x = x + 2;
  } else {
    x = x - 2;
  }

  console.log("O valor de x e: " + x);
}

// Ex_06
{
  let x = 0;
  let i = 0;
  let c = 0;
  while (c < 5) {
    if (i % 2 === 0) {
      x = x + 1;
    }
    i++;
    c++;
    console.log("O valor de x e: " + x);
  }
}

// Ex_07
{
  let x = 1;
  for (let i = 1; i <= 5; i++) {
    x = x + x;
    console.log("O valor de x e: " + x);
  }
}

// Ex_08
{
  let x = 0;
  for (let i = 1; i <= 4; i++) {
    x = x + i * 2;
    console.log("O valor de x e: " + x);
  }
}

// Ex_09
{
  let x = 10;
  while (x > 0) {
    x = x - 3;
    console.log("O valor de x e: " + x);
  }
}

// Ex_10
{
  let x = 0;
  for (let i = 1; i <= 3; i++) {
    x = x + 1;
    console.log("O valor de x e: " + x);
  }
  for (let y = 1; y <= 2; y++) {
    x = x + 3;
    console.log("O valor de x e: " + x);
  }
}
