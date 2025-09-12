package com.quitter.app

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.NavHostFragment
import com.quitter.app.databinding.FragmentSecondBinding

class SecondFragment : Fragment() {
    private var binding: FragmentSecondBinding? = null

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentSecondBinding.inflate(inflater, container, false)
        return binding!!.getRoot()
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        binding!!.buttonSecond.setOnClickListener(View.OnClickListener { v: View? ->
            NavHostFragment.findNavController(this@SecondFragment)
                .navigate(R.id.action_SecondFragment_to_FirstFragment)
        }
        )
    }

    override fun onDestroyView() {
        super.onDestroyView()
        binding = null
    }
}