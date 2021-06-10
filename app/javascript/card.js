const pay = () => {
    Payjp.setPublicKey("pk_test_3f5b573e91202247d9f53b33");
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult); 
      const card = {
        number: formData.get("order_address[number]"),
        cvc: formData.get("order_address[cvc]"),
        exp_month: formData.get("order_address[month]"),
        exp_year: `20${formData.get("order_address[year]")}`,
      };

      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          console.log(token)
        }
      });

    });
  };
  
  window.addEventListener("load", pay);