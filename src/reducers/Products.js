var initState = [
    {
        id : 1,
        name : 'IP 7',
        image : 'https://store.storeimages.cdn-apple.com/4974/as-images.apple.com/is/image/AppleInc/aos/published/images/H/H0/HH0H2/HH0H2?wid=445&hei=445&fmt=jpeg&qlt=95&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=K7ik72',
        description : 'ABCBCBC',
        price : 500,
        inventory : 10, //so luong hang con lai
        rating : '3'
    },{
        id : 2,
        name : 'IP 1',
        image : 'https://store.storeimages.cdn-apple.com/4974/as-images.apple.com/is/image/AppleInc/aos/published/images/H/H0/HH0H2/HH0H2?wid=445&hei=445&fmt=jpeg&qlt=95&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=K7ik72',
        description : 'NCNCNCNCN',
        price : 1500,
        inventory : 10, //so luong hang con lai
        rating : '2'
    },{
        id : 3,
        name : 'IP 2',
        image : 'https://store.storeimages.cdn-apple.com/4974/as-images.apple.com/is/image/AppleInc/aos/published/images/H/H0/HH0H2/HH0H2?wid=445&hei=445&fmt=jpeg&qlt=95&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=K7ik72',
        description : 'KSMCKSMCKMC',
        price : 2500,
        inventory : 10, //so luong hang con lai
        rating : '4'
    }
];

const products = (state = initState, action) => {
    switch (action.type) {

        default:
            return [...state];
    }
}

export default products;