package com.sixseven.bean;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * @author Belly
 * @version 1.1.0
 */
public class Cart {
    private Map<Integer, CartItem> cartItemMap = new HashMap<>();
    private BigDecimal finalTotalPrice;

    public Map<Integer, CartItem> getCartItemMap() {
        return cartItemMap;
    }
    public Integer getNumber() {
        int number = 0;
        Set<Integer> keys = cartItemMap.keySet();
        for (Integer key : keys) {
            Integer count = cartItemMap.get(key).getCount();
            number += count;
//            finalTotalPrice = finalTotalPrice.add(cartItemMap.get(key).getTotalPrice());
        }
        return number;
    }

    public BigDecimal getFinalTotalPrice() {
        finalTotalPrice = new BigDecimal(0);
//        BigDecimal finalTotalPrice = new BigDecimal(0);
        Set<Integer> keys = cartItemMap.keySet();
        for (Integer id : keys) {
            finalTotalPrice = finalTotalPrice.add(cartItemMap.get(id).getTotalPrice());
        }
        return finalTotalPrice;
    }
    public void addItem(CartItem cartItem) {
        CartItem cart = cartItemMap.get(cartItem.getId());
        if (cart == null) {
            cartItemMap.put(cartItem.getId(), cartItem);
            return;
        }
        cart.setCount(cart.getCount() + 1);
        cart.setTotalPrice(cart.getTotalPrice().add(cart.getPrice()));
        cartItemMap.put(cartItem.getId(), cart);

    }
    public void deleteItem(Integer id){
        CartItem cartItem = cartItemMap.get(id);
        if (cartItem != null){
            cartItemMap.remove(id);
        }
    }
    public void modifyItem(Integer id, Integer count){
        CartItem cartItem = cartItemMap.get(id);
        if (cartItem != null){
            cartItem.setCount(count);
            cartItem.setTotalPrice(
                    cartItem.getPrice().multiply(new BigDecimal(cartItem.getCount())));
        }
    }
}
